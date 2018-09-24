/* this header file comes from libowfat, http://www.fefe.de/libowfat/ */
#ifndef ARRAY_H
#define ARRAY_H

#include <stddef.h>
#include "uint64.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
  char* p;
  int64 allocated;  /* in bytes */
  uint64 initialized;  /* in bytes */

  /* p and allocated nonzero: array is allocated */
  /* p and allocated zero: array is unallocated */
  /* p zero and allocated < 0: array is failed */

  size_t headroom;  /* the actual pointer for free() and realloc() is p-headroom */
} array;

void* array_allocate(array* x,uint64 membersize,int64 pos);
void* array_get(const array* const x,uint64 membersize,int64 pos);
void* array_start(const array* const);
void* array_end(const array* const);
int64 array_length(const array* const x,uint64 membersize);
int64 array_bytes(const array* const x);
void array_truncate(array* x,uint64 membersize,int64 len);
void array_trunc(array* x);
void array_reset(array* x);
void array_fail(array* x);
int array_equal(const array* const x,const array* const y);
void array_cat(array* to,const array* const from);
void array_catb(array* to,const void* from,uint64 len);
void array_cats(array* to,const char* from);
void array_cats0(array* to,const char* from);
void array_cat0(array* to);
void array_cate(array* to,const array* const from,int64 pos,int64 stop);

void array_shift(array* x,uint64 membersize,uint64 members);
void array_chop(array* x,uint64 membersize,uint64 members);

#define array_init(ns) byte_zero((ns), sizeof(array))

#define array_failed(x) (array_bytes(x)==-1)
#define array_unallocated(x) (array_bytes(x)==0)

inline static void array_iterator_increment(void** it, uint64 membersize) { char** i = (char**)it; (*i) += membersize; }
inline static int array_iterator_equal(void** it1, void** it2) { char **p1 = (char**)it1, **p2 = (char**)it2; return p1 == p2; }
inline static void* array_iterator_dereference(void** it) { return *it; }

#ifdef __cplusplus
}
#endif

#endif
