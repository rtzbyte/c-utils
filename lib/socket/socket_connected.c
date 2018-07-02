#include <sys/types.h>
#if !(defined(_WIN32) || defined(_WIN64))
#include <sys/socket.h>
#include <netinet/in.h>
#endif
#include "../socket.h"

int socket_connected(int s) {
  struct sockaddr si;
  socklen_t sl=sizeof si;
  if(getpeername(s,&si,&sl))
    return 0;
  return 1;
}
