#include "../windoze.h"
#include "../likely.h"
#include <fcntl.h>

#include "../iarray.h"

#if defined(__BORLANDC__) || defined(__ORANGEC__) || defined(__LCC__)
#define InterlockedCompareExchangePointer(ptr,newptr,oldptr) InterlockedCompareExchange((long*)ptr,(long)newptr,(long)oldptr)
#endif
#ifdef __DMC__
#define InterlockedCompareExchange(p,n,o) InterlockedCompareExchange((void**)p,(void*)n,(void*)o)
#endif


#ifdef __dietlibc__
# include <sys/atomic.h>
#elif WINDOWS_NATIVE || defined(__MSYS__)
# define __CAS(val,oldval,newval) InterlockedCompareExchange(val,newval,oldval)
#  define __CAS_PTR(ptr,oldptr,newptr) InterlockedCompareExchangePointer(ptr,newptr,oldptr)
#elif defined(__GNUC__)
# define __CAS(val,oldval,newval) __sync_val_compare_and_swap(val,oldval,newval)
# if __SIZEOF_POINTER__ == 4
#  define __CAS_PTR(ptr,oldptr,newptr) __sync_val_compare_and_swap_4(ptr,oldptr,newptr)
# else
#  define __CAS_PTR(ptr,oldptr,newptr) __sync_val_compare_and_swap_8(ptr,oldptr,newptr)
# endif
#else
# warning No atomic operations
#endif

#if !WINDOWS_NATIVE
#include <unistd.h>
#include <sys/mman.h>
#endif

#ifndef MAP_ANONYMOUS
#define MAP_ANONYMOUS 0x20

#endif


static iarray_page*
new_page(size_t pagesize) {
#if WINDOWS_NATIVE
  void* x = malloc(pagesize);
  if(x == 0) return 0;
#else
  void* x = mmap(
              0, pagesize, PROT_READ | PROT_WRITE, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
  if(x == MAP_FAILED) return 0;
#endif
  return (iarray_page*)x;
}

void*
iarray_allocate(iarray* ia, size_t pos) {
  size_t index, prevlen = ia->len;
  /* first, find the linked list of pages */
  iarray_page** p =
    &ia->pages[pos % (sizeof(ia->pages) / sizeof(ia->pages[0]))];
  /* this is here so we don't munmap and then re-mmap pages when a
   * certain path makes it necessary to mmap several pages into the
   * linked list and we are competing with another thread that does the
   * same thing */
  iarray_page* newpage = 0;
  /* since we have a fan-out of 16, on page 0 the elements are 0, 16, 32, ...
   * so we divide pos by the fan-out here */
  size_t realpos = pos;
  pos /= sizeof(ia->pages) / sizeof(ia->pages[0]);
  /* now walk the linked list of pages until we reach the one we want */
  for(index = 0;; index += ia->elemperpage) {
    if(!*p) {
      if(!newpage)
        if(!(newpage = new_page(ia->bytesperpage))) return 0;
      if(__CAS_PTR((void*)p, 0, (void*)newpage) == 0) newpage = 0;
    }
    if(index + ia->elemperpage > pos) break;
    p = &(*p)->next;
  }
  if(newpage)
#if WINDOWS
    free(newpage);
#else
    munmap(newpage, ia->bytesperpage);
#endif
  {
    size_t l;
    do { l = (size_t)__CAS(&ia->len, prevlen, realpos); } while(l < realpos);
  }
  return &iarray_data(*p)[(pos - index) * ia->elemsize];
}
