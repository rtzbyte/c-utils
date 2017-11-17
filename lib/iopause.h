/* this header file comes from libowfat, http://www.fefe.de/libowfat/ */
#ifndef IOPAUSE_H
#define IOPAUSE_H

#ifdef __cplusplus
extern "C" {
#endif

#ifdef IOPAUSE_POLL

/* sysdep: +poll */

#include <sys/types.h>
#include <sys/poll.h>

typedef struct pollfd iopause_fd;
#define IOPAUSE_READ POLLIN
#define IOPAUSE_WRITE POLLOUT

#include "taia.h"

extern void iopause(iopause_fd *,unsigned int,struct taia *,struct taia *);

#else

/* sysdep: -poll */

typedef struct {
  int fd;
  short events;
  short revents;
} iopause_fd;

#define IOPAUSE_READ 1
#define IOPAUSE_WRITE 4

#include "taia.h"

extern void iopause(iopause_fd *,unsigned int,struct taia *,struct taia *);

#endif /* IOPAUSE_POLL */

#ifdef __cplusplus
}
#endif
#endif