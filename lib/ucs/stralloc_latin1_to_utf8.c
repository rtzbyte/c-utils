#include "../stralloc.h"
#include "../ucs.h"

size_t
stralloc_latin1_to_utf8(const stralloc* in, stralloc* out) {
  const char* x;
  size_t start = out->len, i;
  char buf[4];

  for(i = 0; i <  in->len; ++i)
    stralloc_catb(out, buf, fmt_latin1_utf8(buf, x[i]));

  return out->len - start; 
}

