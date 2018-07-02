#if defined(_WIN32) || defined(_WIN64)
#else
#endif
#include <fcntl.h>
#include <errno.h>
#include "../io_internal.h"

#if defined(_WIN32) || defined(_WIN64)
#include <winsock2.h>
#include "../windoze.h"
#endif

#ifndef O_NDELAY
#define O_NDELAY O_NONBLOCK
#endif

void io_nonblock(int64 d) {
  io_entry* e=iarray_get(io_getfds(),d);
#if defined(_WIN32) || defined(_WIN64)
  unsigned long i=1;
  if(ioctlsocket( d, FIONBIO, &i)==0)
    if(e) e->nonblock=1;
#else
  if(fcntl(d,F_SETFL,fcntl(d,F_GETFL,0) | O_NDELAY)==0)
    if(e) e->nonblock=1;
#endif
}
