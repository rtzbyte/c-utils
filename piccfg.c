#include "lib/uint8.h"
#include "lib/uint16.h"
#include "lib/uint32.h"
#include "lib/slist.h"
#include "lib/mmap.h"
#include "lib/alloc.h"
#include "lib/byte.h"
#include "lib/str.h"
#include "lib/scan.h"
#include "lib/ihex.h"
#include "lib/stralloc.h"
#include "lib/buffer.h"
#include "lib/map.h"
#include "lib/strlist.h"
#include "lib/getopt.h"
#include <assert.h>

typedef struct cvalue {
  struct cvalue* next;
  uint16 value;
  int is_default;
  const char* name;
  const char* description;
} cvalue;

typedef struct csetting {
  struct csetting* next;
  uint16 mask;
  const char* name;
  const char* description;
  struct cvalue* values;
} csetting;

typedef struct cword {
  struct cword* next;
  uint32 address;
  uint16 mask;
  uint16 default_value;
  const char* name;
  csetting* settings;
} cword;

static cword* words;
static ihex_file hex;
static uint32 addr;
static stralloc cfg;
// static map_t(const char*) pragmas;
static strlist pragmas;
static int defval = 1, oneline = 0, comments = 1, output_name = 0;

uint8
config_byte_at(uint32 addr) {
  size_t offs = addr & 0x0fff;
  assert(offs < cfg.len);
  return cfg.s[offs];
}

void
dump_cword(buffer* b, cword* word) {
  buffer_puts(b, word->name ? word->name : "(null)");
  buffer_puts(b, " @ 0x");
  buffer_putxlong0(b, word->address, 4);
  buffer_puts(b, "\tmask 0x");
  buffer_putxlong0(b, word->mask, 2);
  buffer_puts(b, "\tdefault 0x");
  buffer_putxlong0(b, word->default_value, 2);
  buffer_putnlflush(b);
}

void
dump_csetting(buffer* b, csetting* setting) {
  buffer_puts(b, "  ");
  buffer_puts(b, setting->name ? setting->name : "(null)");
  buffer_puts(b, "\tmask 0x");
  buffer_putxlong0(b, setting->mask, 2);
  buffer_puts(b, "\t\t");
  buffer_puts(b, setting->description);
  buffer_putnlflush(b);
}
void
dump_cvalue(buffer* b, cvalue* value) {
  buffer_puts(b, "    ");
  buffer_puts(b, value->name ? value->name : "(null)");
  buffer_puts(b, "\tvalue 0x");
  buffer_putxlong0(b, value->value, 2);
  buffer_puts(b, "\t\t");
  buffer_puts(b, value->description);
  buffer_putnlflush(b);
}

cvalue**
parse_cfgvalue(cvalue** vptr, cword* w, csetting* s, const char* x, size_t n) {
  cvalue* v = *vptr = alloc(sizeof(cvalue));
  size_t i;
  unsigned long value;
  i = scan_xlongn(x, n, &value);
  assert(i);
  v->is_default = (w->default_value & s->mask) == value;
  v->value = value;
  x += i + 1;
  n -= i + 1;
  i = byte_chr(x, n, ':');
  v->name = str_ndup(x, i);
  assert(i < n);
  x += i + 1;
  n -= i + 1;
  v->description = str_ndup(x, n);
  v->next = NULL;
  return &v->next;
}

csetting**
parse_cfgsetting(csetting** sptr, cword* w, const char* x, size_t n) {
  csetting* s = *sptr = alloc(sizeof(csetting));
  size_t i;
  unsigned long value;
  i = scan_xlongn(x, n, &value);
  assert(i);
  s->mask = value;
  x += i + 1;
  n -= i + 1;
  i = byte_chr(x, n, ':');
  s->name = str_ndup(x, i);
  assert(i < n);
  x += i + 1;
  n -= i + 1;
  s->description = str_ndup(x, n);
  s->next = NULL;
  s->values = NULL;
  return &s->next;
}

cword**
parse_cfgword(cword** wptr, const char* x, size_t n) {
  cword* w = *wptr = alloc(sizeof(cword));
  size_t i;
  unsigned long value;
  i = scan_xlongn(x, n, &value);
  assert(i);
  w->address = value;
  x += i + 1;
  n -= i + 1;
  i = scan_xlongn(x, n, &value);
  assert(i);
  w->mask = value;
  x += i + 1;
  n -= i + 1;
  i = scan_xlongn(x, n, &value);
  assert(i);
  w->default_value = value;
  x += i + 1;
  n -= i + 1;
  w->name = str_ndup(x, n);
  w->next = NULL;
  w->settings = NULL;
  return &w->next;
}

int
parse_cfgdata(cword** wptr, const char* x, size_t n) {
  size_t eol, col;
  cword* w = 0;
  csetting *s = 0, **sptr = NULL;
  cvalue *v = 0, **vptr = NULL;

  while(n > 0) {

    eol = byte_chr(x, n, '\n');

    if(eol > 0 && x[0] == 'C') {
      const char* line = x;
      col = byte_chr(x, n, ':') + 1;
      assert(col < eol);
      x += col;
      n -= col;
      eol -= col;

      if(!str_diffn(line, "CWORD", 5)) {
        cword** nwptr = parse_cfgword(wptr, x, eol);
        w = *wptr;
        sptr = &w->settings;
        wptr = nwptr;
      } else if(!str_diffn(line, "CSETTING", 8)) {
        csetting** nsptr = parse_cfgsetting(sptr, w, x, eol);
        s = *sptr;
        vptr = &s->values;
        sptr = nsptr;
      } else if(!str_diffn(line, "CVALUE", 6)) {
        cvalue** nvptr = parse_cfgvalue(vptr, w, s, x, eol);
        v = *vptr;
        vptr = nvptr;
      }
    }

    if(eol < n)
      eol++;

    x += eol;
    n -= eol;
  }
}

size_t
config_bytes(ihex_file* ihf, stralloc* sa, uint32* addr) {
  size_t bytes;
  stralloc_zero(sa);
  stralloc_ready(sa, 14);

  if(((bytes = ihex_read_at(&hex, 0x00300000, sa->s, 14)) == 14)) {
    *addr = 0x00300000;
  } else {
    if((bytes = ihex_read_at(&hex, 0x400e, sa->s, 2)) == 2)
      *addr = 0x400e;
  }

  sa->len = bytes;
  return bytes;
}

uint8
get_setting_byte(cword* word, csetting* setting) {
  uint8 value = config_byte_at(word->address);

  value &= setting->mask;

  return value;
}

cvalue*
get_setting_value(cword* word, csetting* setting) {
  cvalue* value;
  uint8 byteval = get_setting_byte(word, setting);
  slink_foreach(setting->values, value) {
    if(value->value == byteval)
      return value;
  }
  return NULL;
}

csetting*
find_setting(const char* str) {
  cword* word;
  csetting* setting;
  slink_foreach(words, word) {
    slink_foreach(word->settings, setting) {
      if(!str_diffn(str, setting->name, str_len(setting->name)))
        return setting;
    }
  }
  return NULL;
}

cvalue*
find_value(const char* str) {
  csetting* setting = find_setting(str);
  cvalue* value;
  str += str_chr(str, '=');
  while(*str == '=' || *str == ' ') ++str;
  slink_foreach(setting->values, value) {
    if(!str_diffn(str, value->name, str_len(value->name)))
      return value;
  }
  return NULL;
}

void
add_item(const char* name, const char* value) {

  stralloc out;
  stralloc_init(&out);

  if(value)
    stralloc_catm_internal(&out, name, " = ", value, 0);
  else
    stralloc_catm_internal(&out, "// ", name, 0);

  strlist_push_sa(&pragmas, &out);

  stralloc_free(&out);
}

void
process_config(void (*callback)(const char* key, const char* value)) {
  cword *prevword = 0, *word;
  csetting* setting;
  cvalue* value;

  slink_foreach(words, word) {
    if(!str_diffn(word->name, "IDLOC", 5))
      break;

    dump_cword(buffer_2, word);

    slink_foreach(word->settings, setting) {

      value = get_setting_value(word, setting);

      if(value->is_default && !defval) {
#ifdef DEBUG_OUTPUT
        buffer_putm_internal(buffer_2, "skip default value ", value->name, " for setting ", setting->name, 0);
        buffer_putnlflush(buffer_2);
#endif
        continue;
      }

      if(output_name && prevword != word)
        callback(word->name, NULL);

      callback(setting->name, value->name);
      prevword = word;
    }
  }
}

void
output_items(const strlist* items) {
  const char* x;
  int i, col = 0;
  size_t n;

  i = 0;
  strlist_foreach(items, x, n) {
    if(x[0] != '/') {
      if(i)
        buffer_puts(buffer_2, (oneline && col > 0) ? ", " : "\n#pragma ");
      else
        buffer_puts(buffer_2, "#pragma ");

    } else if(i) {
      col = -1;
      buffer_puts(buffer_2, "\n\n");
    }

    if(comments && !oneline) {
      csetting* setting = find_setting(x);
      const char* description = setting ? setting->description : 0;
      cvalue* value = find_value(x);
      if(value)
        description = value->description;
      buffer_putspad(buffer_2, x, 20);
      buffer_putm_internal(buffer_2, " // ", description, 0);

    } else

      buffer_put(buffer_2, x, n);
    ++i;
    ++col;
  }
  buffer_putnlflush(buffer_2);
}

/**
 * @brief usage  Show command line usage
 * @param argv0
 */
void
usage(char* argv0) {
  buffer_putm_internal(buffer_1,
                       "Usage: ",
                       str_basename(argv0),
                       " <hex-file> <cfgdata-file>\n"
                       "\n"
                       "Options\n"
                       "  -h, --help                show this help\n"
                       "  -o, --oneline             output oneliner\n"
                       "  -D, --no-default          don't output settings with default value\n"
                       "  -C, --no-comments         don't output description comments\n"
                       "  -n, --name                output register name\n"
                       "\n",
                       NULL);
  buffer_putnlflush(buffer_1);
}

int
main(int argc, char* argv[]) {
  const char* x;
  size_t i, n;
  int c, index = 0;
  const char *cfgdata = 0, *hexfile = 0;

  struct longopt opts[] = {{"help", 0, NULL, 'h'},
                           {"oneline", 0, &oneline, 1},
                           {"no-default", 0, &defval, 0},
                           {"no-comments", 0, &comments, 0},
                           {"name", 0, &output_name, 1},
                           {0, 0, 0, 0}};

  for(;;) {
    c = getopt_long(argc, argv, "hoDCn", opts, &index);
    if(c == -1)
      break;
    if(c == 0)
      continue;

    switch(c) {
      case 'h': usage(argv[0]); return 0;
      case 'o': oneline = 1; break;
      case 'D': defval = 0; break;
      case 'C': comments = 0; break;
      case 'n': output_name = 1; break;
      default:
        buffer_puts(buffer_2, "No such option '-");
        buffer_putc(buffer_2, c);
        buffer_putsflush(buffer_2, "'\n");

        return 1;
    }
  }

  if(optind < argc) {
    hexfile = argv[optind++];
    if(optind < argc)
      cfgdata = argv[optind++];
  }

  if(!cfgdata)
    cfgdata = "/opt/microchip/xc8/v1.43/dat/cfgdata/18f2550.cfgdata";

  if(!hexfile)
    hexfile = "/home/roman/Sources/pictest/bootloaders/usb-msd-bootloader-18f2550.hex";

  x = mmap_read(cfgdata, &n);
  parse_cfgdata(&words, x, n);
  mmap_unmap(x, n);

  x = mmap_read(hexfile, &n);
  ihex_load_buf(&hex, x, n);
  mmap_unmap(x, n);

  stralloc_init(&cfg);
  config_bytes(&hex, &cfg, &addr);

  for(size_t i = 0; i < cfg.len; i += 2) {
    uint16 v = uint16_read(&cfg.s[i]);

    buffer_putxlong0(buffer_2, addr + i, 4);
    buffer_puts(buffer_2, ": ");
    buffer_putxlong0(buffer_2, v, 4);
    buffer_putnlflush(buffer_2);
  }

  strlist_init(&pragmas, '\0');

  process_config(&add_item);

  output_items(&pragmas);

  return 0;
}