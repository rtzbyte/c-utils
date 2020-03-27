#include "../strarray.h"
#include "../array.h"
#include "../byte.h"
#include "../safemult.h"
#include "../uint64.h"
#include "../str.h"
#include "../alloc.h"

int64
strarray_splice(strarray* a, uint64 start, uint64 del, uint64 insert, const char** x) {
  if(array_start(a) == NULL) {
    array_allocate(a, sizeof(char*), 0);
    array_trunc(a);
  }
  char** s = array_get(a, sizeof(char*), start);
  uint64 i, len, newlen;
  len = strarray_size(a);
  if(start + del > len)
    del = len - start;
  for(i = 0; i < del; i++) alloc_free(s[i]);
  newlen = len - del + insert;
  if(insert != del) {
    size_t nmove = len - (start + del);
    size_t movepos = &s[i] - (char**)array_start(a);
    char** end = array_end(a);
    if(insert > del) {
      end = array_allocate(a, sizeof(char*), newlen);
      s = end - newlen + start;
      // move = s + del;
    }
    if(nmove) {
      (insert > del ? byte_copyr : byte_copy)(&s[insert], nmove * sizeof(char*), array_get(a, sizeof(char*), movepos));
    }
  }
  for(i = 0; i < insert; ++i) s[i] = str_dup(x[i]);
  array_truncate(a, sizeof(char*), newlen);
  return newlen;
}