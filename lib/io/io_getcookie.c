#if defined(_WIN32) || defined(_WIN64)
#else
#endif
#include "../io_internal.h"

void* io_getcookie(int64 d) {
  io_entry* e;
  e=iarray_get(io_getfds(),d);
  return e?e->cookie:0;
}
