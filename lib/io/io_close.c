#include "../io.h"
#include "../windoze.h"

#include <sys/types.h>
#if WINDOWS_NATIVE
#include <windows.h>
#include <io.h>
#else
#include <unistd.h>
#include <sys/mman.h>
#endif

#include "../io_internal.h"

extern void io_dontwantread_really(fd_t d, io_entry* e);
extern void io_dontwantwrite_really(fd_t d, io_entry* e);

void
io_close(fd_t d) {
  io_entry* e;
  if((e = (io_entry*)iarray_get((iarray*)io_getfds(), d))) {
    e->inuse = 0;
    e->cookie = 0;
    if(e->kernelwantread)
      io_dontwantread_really(d, e);
    if(e->kernelwantwrite)
      io_dontwantwrite_really(d, e);
    if(e->mmapped) {
#if WINDOWS_NATIVE
      UnmapViewOfFile(e->mmapped);
      CloseHandle(e->mh);
#else
      munmap(e->mmapped, e->maplen);
#endif
      e->mmapped = 0;
    }
  }
  close(d);
}
