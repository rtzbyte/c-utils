#include "../windoze.h"
//#define USE_WS2_32 1
#include "../socket_internal.h"
#include "../buffer.h"
#include "../http.h"
#include "../io.h"
#include "../ndelay.h"

#ifdef HAVE_OPENSSL
#include <openssl/ssl.h>
#include <openssl/err.h>
#endif

#if WINDOWS_NATIVE
#include <io.h>
#else
#include <unistd.h>
#endif
#include <errno.h>
#include <stdio.h>

size_t http_read_internal(http* h, char* buf, size_t n);

ssize_t http_socket_read(fd_t fd, void* buf, size_t len, buffer* b);

#ifdef HAVE_OPENSSL
ssize_t
http_ssl_write(fd_t fd, const void* buf, size_t n, http* h) {
  ssize_t ret;
  int err;

  errno = 0;

  ret = SSL_write(h->ssl, buf, n);
  /* it was not done */
  if(ret <= 0) {
    /* get error code */
    err = SSL_get_error(h->ssl, ret);
    /* call ssl_write() again when socket gets writeable */
    if(err == SSL_ERROR_WANT_WRITE) {
      errno = EWOULDBLOCK;
      return -1;
      /* call ssl_write() again when socket gets writeable */
    } else if(err == SSL_ERROR_WANT_READ) {
      errno = EAGAIN;
      return -1;
    } else if(err == SSL_ERROR_SYSCALL) {
      /* ignore these */
      if(errno == EWOULDBLOCK || errno == EINTR || errno == EAGAIN) {
        //   errno = EWOULDBLOCK;
        return -1;
      }
      return -1;
    } else if(err == SSL_ERROR_ZERO_RETURN)
      return 0;
  }
  return ret;
}
#endif

static ssize_t
http_socket_write(fd_t fd, void* buf, size_t len, buffer* b) {
  http* h = b->cookie;

#ifdef HAVE_OPENSSL
  if(h->ssl)
    return http_ssl_write(h->sock, buf, len, h);
#endif
  return winsock2errno(send(fd, buf, len, 0));
}

#ifdef HAVE_OPENSSL
static SSL_CTX* http_sslctx;
static SSL_CTX*
new_sslctx(void) {
  const SSL_METHOD* method;
  SSL_CTX* ctx;

#if OPENSSL_API_COMPAT >= 0x10100000L
  const OPENSSL_INIT_SETTINGS* settings = OPENSSL_INIT_new();
  OPENSSL_init_ssl(OPENSSL_INIT_LOAD_SSL_STRINGS | OPENSSL_INIT_LOAD_CRYPTO_STRINGS, settings);
  method = TLS_client_method(); /* create new server-method instance */
#else
  SSL_library_init();
  OpenSSL_add_all_algorithms();    /* load & register all cryptos, etc. */
  SSL_load_error_strings();        /* load all error messages */
  method = SSLv23_client_method(); /* create new server-method instance */
#endif
  ctx = SSL_CTX_new(method); /* create new context from method */
  if(ctx == NULL) {
    ERR_print_errors_fp(stderr);
    abort();
  }
  return ctx;
}
#endif

int
http_socket(http* h, int nonblock) {
  if((h->sock = socket_tcp4()) == -1)
    return -1;

  if(nonblock)
    ndelay_on(h->sock);
  else
    ndelay_off(h->sock);

  io_fd(h->sock);
#ifdef HAVE_OPENSSL
  if(!http_sslctx)
    http_sslctx = new_sslctx();
  h->ssl = SSL_new(http_sslctx);
  SSL_set_fd(h->ssl, h->sock);
#endif

  if(h->q.in.x) {
    h->q.in.fd = h->sock;
  } else {
    buffer_read_fd(&h->q.in, h->sock);
    h->q.in.cookie = (void*)h;
  }

  h->q.in.op = (buffer_op_proto*)&http_socket_read;

  if(h->q.out.x) {
    h->q.out.fd = h->sock;
  } else {
    buffer_write_fd(&h->q.out, h->sock);
    h->q.out.cookie = (void*)h;
  }
  h->q.out.op = (buffer_op_proto*)&http_socket_write;

  return 0;
}
