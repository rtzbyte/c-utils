#include "buffer.h"
#include "rdir.h"

int
main() {

  struct rdir_s rd;
  char *s;
  int r = rdir_open(&rd, "/etc");

  while((s = rdir_read(&rd))) {
    buffer_putm(buffer_1, s, "\n", NULL);
    buffer_flush(buffer_1);

  }
  rdir_close(&rd);
  return 0;


}
