#include "../buffer.h"
#include "../mmap.h"

static ssize_t
op(fd_t fd, void* buf, size_t len, void* arg) {
  return 0;
}

int
buffer_mmapread(buffer* b, const char* filename) {
  if(!(b->x = (char*)mmap_read(filename, &b->n))) return -1;
  b->p = 0;
  b->a = b->n;
  b->fd = -1;
  b->op = 0;
  b->deinit = buffer_munmap;
  return 0;
}
