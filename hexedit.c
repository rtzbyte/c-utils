#include "lib/mmap.h"
#include "lib/buffer.h"
#include "lib/scan.h"
#include "lib/uint64.h"

char hexdigits[] = "0123456789abcdef";

size_t n;
unsigned char* p;

void
print(unsigned char* p, size_t i, unsigned char from, unsigned char to) {
  buffer_puts(buffer_2, "0x");
  buffer_putxlong(buffer_2, i);
  buffer_putspace(buffer_2);
  buffer_puts(buffer_2, "0x");
  buffer_putc(buffer_2, hexdigits[from >> 4]);
  buffer_putc(buffer_2, hexdigits[from & 0x0f]);
  buffer_putspace(buffer_2);
  buffer_puts(buffer_2, "0x");
  buffer_putc(buffer_2, hexdigits[to >> 4]);
  buffer_putc(buffer_2, hexdigits[to & 0x0f]);
}

void
patch(unsigned char* p, size_t i, unsigned char from, unsigned char to) {
  buffer_puts(buffer_2, "patch ");
  print(p, i, from, to);
  if(p[i] == from) {
    p[i] = to;
    buffer_puts(buffer_2, " ok");
  } else {
    buffer_puts(buffer_2, " fail");
  }
  buffer_putnlflush(buffer_2);
}

void
usage(const char* av0) {
  buffer_putm(buffer_2,
              "Usage: ",
              av0,
              " <file> [edit-specifier]\n"
              "\n"
              "  [edit-specifier] is <address>=<value>\n"
              "\n");
  buffer_putnlflush(buffer_2);
}

int
main(int argc, char* argv[]) {

  unsigned long long addr = 0;
  size_t s_cmp = 0, s_set = 0;
  unsigned long long val_cmp = 0, val_set = 0;

  int index = 1;

  if(argc <= index) {
    usage(argv[0]);
    return 1;
  }

  p = (unsigned char*)mmap_private(argv[index], &n);

  while(++index < argc) {
    char* spec = argv[index];
    char sym = spec[0], *s = &spec[1];

    if(sym == '@') {
      scan_xlonglong(s, &addr);
    } else if(sym == '?') {
      s_cmp = (scan_xlonglong(s, &val_cmp) + 1) / 2;
    } else if(sym == '=') {
      s_set = (scan_xlonglong(s, &val_set) + 1) / 2;
    } else {
      buffer_putm(buffer_2, "ERROR: ", spec, "\n");
      buffer_putnlflush(buffer_2);
      return 2;
    }
  }

  /* Sublime Text 3176 */

  patch(p, 0x3985A, 0x00, 0x01); // Persistent License Check
  patch(p, 0x3A073, 0x38, 0x08);
  patch(p, 0x3A074, 0x00, 0x01); // Initial License Check
  patch(p, 0x792FB, 0x57, 0xC3); // Software Update Prompt

  // patch(p, 0x00076608, 0x90, 0xeb);
  // patch(p, 0x0023f89c, 0xdf, 0x75);
  // patch(p, 0x00076626, 0x8b, 0x75);
  // patch(p, 0x000b23c9, 0x10, 0x85);
  // patch(p, 0x00076609, 0x48, 0x2a);

  mmap_unmap(p, n);
}
