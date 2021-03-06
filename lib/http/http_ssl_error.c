#include "../http.h"
#include "../io.h"

#ifdef HAVE_OPENSSL
#include <openssl/ssl.h>
#include <openssl/err.h>

const char*
http_ssl_errflag(int i) {
  switch(i) {
    case SSL_ERROR_NONE: return "NONE";
    case SSL_ERROR_SSL: return "SSL";
    case SSL_ERROR_WANT_READ: return "WANT_READ";
    case SSL_ERROR_WANT_WRITE: return "WANT_WRITE";
    case SSL_ERROR_WANT_X509_LOOKUP: return "WANT_X509_LOOKUP";
    case SSL_ERROR_SYSCALL: return "SYSCALL";
    case SSL_ERROR_ZERO_RETURN: return "ZERO_RETURN";
    case SSL_ERROR_WANT_CONNECT: return "WANT_CONNECT";
    case SSL_ERROR_WANT_ACCEPT: return "WANT_ACCEPT";
    case SSL_ERROR_WANT_ASYNC: return "WANT_ASYNC";
    case SSL_ERROR_WANT_ASYNC_JOB: return "WANT_ASYNC_JOB";
    case SSL_ERROR_WANT_CLIENT_HELLO_CB: return "WANT_CLIENT_HELLO_CB";
    default: return "no such error";
  }
}

int
http_ssl_error(http* h, ssize_t ret) {
  char buf[256];
  size_t n = sizeof(buf);
  int err = 0;
  if(ret <= 0) {
    err = SSL_get_error(h->ssl, ret);

    h->err = err;

    ERR_error_string_n(err, buf, n);
    ERR_clear_error();

    if(err == SSL_ERROR_WANT_READ) {
      errno = EAGAIN;
      ret = -1;
    } else if(err == SSL_ERROR_WANT_WRITE) {
      errno = EWOULDBLOCK;
      ret = -1;
    } else if(err == SSL_ERROR_SYSCALL) {
      if(errno == EWOULDBLOCK || errno == EINTR || errno == EAGAIN)
        ret = -1;
    } else if(err == SSL_ERROR_ZERO_RETURN) {
      ret = 0;
    } else if(err == SSL_ERROR_SSL) {
      ret = 1;
      err = 0;
    } else {
      ret = -1;
    }
  }
  return err;
}
#endif
