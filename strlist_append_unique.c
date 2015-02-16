#include "strlist.h"

int
strlist_append_unique(strlist* sl, const char* s) {
  if(strlist_index_of(sl, s) != -1)
    return -1;

  return strlist_append(sl, s);
}