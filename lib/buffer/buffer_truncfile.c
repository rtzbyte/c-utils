#include "../windoze.h"
#include "../buffer.h"
#include "../open.h"

#if WINDOWS_NATIVE
#ifdef _MSC_VER
#define _CRT_INTERNAL_NONSTDC_NAMES 1
#endif
#include <io.h>
#if !defined(__LCC__) && !defined(__MINGW32__)
#define read _read
#define write _write
#define open _open
#define close _close
#endif
#else
#include <unistd.h>
#endif
#include <stdlib.h>
#include "../alloc.h"

int
buffer_truncfile(buffer* b, const char* fn) {
  if((b->fd = open_trunc(fn)) == -1)
    return -1;
  b->p = 0;
  b->n = 0;
  b->a = BUFFER_OUTSIZE;
  b->x = (char*)alloc(b->a);
  b->op = (buffer_op_proto*)&write;
  b->deinit = (void (*)()) & buffer_free;
  return 0;
}
