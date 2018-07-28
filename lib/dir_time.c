#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#if USE_READDIR
#include <dirent.h>
#include <sys/stat.h>
#endif
#include "dir.h"
#include "dir_internal.h"

time_t
dir_time(struct dir_s* d, int time_type) {
  unsigned long long r = 0;
#if USE_READDIR
  const char* name = dir_INTERNAL(d)->dir_entry->d_name;
  struct stat st;

  lstat(name, &st);

  switch (time_type) {
    case D_TIME_CREATION: r = st.st_ctime; break;
    case D_TIME_ACCESS: r = st.st_atime; break;
    case D_TIME_MODIFICATION: r = st.st_mtime; break;
  }
#endif
  return r;
}