#include "../str.h"
#include "../stralloc.h"

extern int
stralloc_cat(stralloc* sa, const stralloc* sa2) {
  return stralloc_catb(sa, sa2->s, sa2->len);
}

