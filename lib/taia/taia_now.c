#include "../windoze.h"

#include "../uint64.h"
#include "../taia.h"
#include <sys/types.h>
#if WINDOWS
#include <windows.h>
#else
#include <sys/time.h>
#endif

void
taia_now(struct taia* t) {
#if WINDOWS
  union {
    FILETIME f;
    uint64 l;
  } fnord;
  GetSystemTimeAsFileTime(&fnord.f);
  /* 64-bit value representing the number of 100-nanosecond intervals
   * since January 1, 1601 (UTC) */
  fnord.l -= ((int64)(1970 - 1601)) * 365 * 24 * 60 * 60;
  t->sec.x = fnord.l / 10000000;
  t->nano = ((fnord.l + 5) / 10) % 1000000;
  t->atto = 0;
#else
  struct timeval now;
  gettimeofday(&now, (struct timezone*)0);
  tai_unix(&t->sec, now.tv_sec);
  t->nano = (uint32)(1000 * now.tv_usec + 500);
  t->atto = 0;
#endif
}
