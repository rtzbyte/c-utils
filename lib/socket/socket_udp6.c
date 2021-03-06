#define USE_WS2_32 1
#include "../socket_internal.h"
#include <sys/types.h>
#include "../ndelay.h"
#include <errno.h>

#ifndef EAFNOSUPPORT
#define EAFNOSUPPORT EINVAL
#endif

#ifndef EPFNOSUPPORT
#define EPFNOSUPPORT EAFNOSUPPORT
#endif

#ifndef EPROTONOSUPPORT
#define EPROTONOSUPPORT EAFNOSUPPORT
#endif

int
socket_udp6b(void) {
#ifdef LIBC_HAS_IP6
  int s;

  __winsock_init();
  if(noipv6)
    goto compat;
  s = winsock2errno(socket(PF_INET6, SOCK_DGRAM, 0));
  if(s == -1) {
#ifndef __CYGWIN__
    if(!(errno == EINVAL || errno == EAFNOSUPPORT || errno == EPFNOSUPPORT || errno == EPROTONOSUPPORT))
      return -1;
#endif
    {
    compat:
      s = winsock2errno(socket(AF_INET, SOCK_DGRAM, 0));
      noipv6 = 1;
      if(s == -1)
        return -1;
    }
  }
#ifdef IPV6_V6ONLY
  {
    int zero = 0;
    winsock2errno(setsockopt(s, IPPROTO_IPV6, IPV6_V6ONLY, (void*)&zero, sizeof(zero)));
  }
#endif
  return s;
#else
  return socket_udp4b();
#endif
}

int
socket_udp6(void) {
  int s = socket_udp6b();
  if(s != -1 && ndelay_on(s) == -1) {
    closesocket(s);
    return -1;
  }
  return s;
}
