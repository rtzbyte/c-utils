#if defined _WIN32 || defined _WIN64

#include "../socket_internal.h"

/*
 * Create a socketpair using the protocol specified
 * This function uses winsock semantics, it returns SOCKET handles, not FDs
 * Currently supports TCP/IPv4 socket pairs only
 */
int wsa_socketpair(int af, int type, int proto, SOCKET sock[2]) {
/*  assert(af == AF_INET
      && type == SOCK_STREAM
      && (proto == IPPROTO_IP || proto == IPPROTO_TCP));*/

  SOCKET listen_sock;
  SOCKADDR_IN addr1;
  SOCKADDR_IN addr2;
  int err;
  int addr1_len = sizeof (addr1);
  int addr2_len = sizeof (addr2);
  sock[1] = INVALID_SOCKET;
  sock[2] = INVALID_SOCKET;

  if((listen_sock = socket(af, type, proto)) == INVALID_SOCKET)
    goto error;

  memset((void*)&addr1, 0, sizeof(addr1));
  addr1.sin_family = af;
  addr1.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
  addr1.sin_port = 0;

  if(bind(listen_sock, (SOCKADDR*)&addr1, addr1_len) == SOCKET_ERROR)
    goto error;

  if(getsockname(listen_sock, (SOCKADDR*)&addr1, &addr1_len) == SOCKET_ERROR)
    goto error;

  if(listen(listen_sock, 1))
    goto error;

  if((sock[0] = socket(af, type, proto)) == INVALID_SOCKET)
    goto error;

  if(connect(sock[0], (SOCKADDR*)&addr1, addr1_len))
    goto error;

  if((sock[1] = accept(listen_sock, 0, 0)) == INVALID_SOCKET)
    goto error;

  if(getpeername(sock[0], (SOCKADDR*)&addr1, &addr1_len) == SOCKET_ERROR)
    goto error;

  if(getsockname(sock[1], (SOCKADDR*)&addr2, &addr2_len) == SOCKET_ERROR)
    goto error;

  if(addr1_len != addr2_len
      || addr1.sin_addr.s_addr != addr2.sin_addr.s_addr
      || addr1.sin_port        != addr2.sin_port)
    goto error;

  closesocket(listen_sock);

  return 0;

error:
   err = WSAGetLastError();

  if(listen_sock != INVALID_SOCKET)
    closesocket(listen_sock);

  if(sock[0] != INVALID_SOCKET)
    closesocket(sock[0]);

  if(sock[1] != INVALID_SOCKET)
    closesocket(sock[1]);

  WSASetLastError(err);

  return SOCKET_ERROR;
}


/*
 * Create a sync-async socketpair using the protocol specified,
 * returning a synchronous socket and an asynchronous socket.
 * Upon completion asyncSocket is opened with the WSA_FLAG_OVERLAPPED flag set,
 * syncSocket won't have it set.
 * Currently supports TCP/IPv4 socket pairs only
 */
int wsa_sync_async_socketpair(int af, int type, int proto, SOCKET *syncSocket, SOCKET *asyncSocket) {
  assert(af == AF_INET
      && type == SOCK_STREAM
      && (proto == IPPROTO_IP || proto == IPPROTO_TCP));

  SOCKET listen_sock;
  SOCKET sock1 = INVALID_SOCKET;
  SOCKET sock2 = INVALID_SOCKET;
  SOCKADDR_IN addr1;
  SOCKADDR_IN addr2;
  int err;
  int addr1_len = sizeof (addr1);
  int addr2_len = sizeof (addr2);

  if((listen_sock = socket(af, type, proto)) == INVALID_SOCKET)
    goto error;

  memset((void*)&addr1, 0, sizeof(addr1));
  addr1.sin_family = af;
  addr1.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
  addr1.sin_port = 0;

  if(bind(listen_sock, (SOCKADDR*)&addr1, addr1_len) == SOCKET_ERROR)
    goto error;

  if(getsockname(listen_sock, (SOCKADDR*)&addr1, &addr1_len) == SOCKET_ERROR)
    goto error;

  if(listen(listen_sock, 1))
    goto error;

  if((sock1 = wsa_sync_socket(af, type, proto)) == INVALID_SOCKET)
    goto error;

  if(connect(sock1, (SOCKADDR*)&addr1, addr1_len))
    goto error;

  if((sock2 = accept(listen_sock, 0, 0)) == INVALID_SOCKET)
    goto error;

  if(getpeername(sock1, (SOCKADDR*)&addr1, &addr1_len) == SOCKET_ERROR)
    goto error;

  if(getsockname(sock2, (SOCKADDR*)&addr2, &addr2_len) == SOCKET_ERROR)
    goto error;

  if(addr1_len != addr2_len
      || addr1.sin_addr.s_addr != addr2.sin_addr.s_addr
      || addr1.sin_port        != addr2.sin_port)
    goto error;

  closesocket(listen_sock);

  *syncSocket = sock1;
  *asyncSocket = sock2;

  return 0;

error:
  err = WSAGetLastError();

  if(listen_sock != INVALID_SOCKET)
    closesocket(listen_sock);

  if(sock1 != INVALID_SOCKET)
    closesocket(sock1);

  if(sock2 != INVALID_SOCKET)
    closesocket(sock2);

  WSASetLastError(err);

  return SOCKET_ERROR;
}

#endif