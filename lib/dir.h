#ifndef _DIR_H__
#define _DIR_H__

#include <time.h>

#ifdef __cplusplus
extern "C" {
#endif

#if 0 //defined(__MINGW32__) || defined(__MSYS__)
#define PATHSEP_C '\\'
#define PATHSEP_S "\\"
#else
#define PATHSEP_C '/'
#define PATHSEP_S "/"
#endif
#define IS_PATHSEP(c) ((c) == '\\'||(c) == '/')

enum
{
  D_FILE = 0x20,
  D_DIRECTORY = 0x10,
  D_SYMLINK = 0x08,
};

enum
{
  D_TIME_CREATION,
  D_TIME_ACCESS,
  D_TIME_MODIFICATION,
};

struct dir_s { void* dir_int; };

int dir_open(struct dir_s* d, const char* p);
char* dir_read(struct dir_s* d);
void dir_close(struct dir_s* d);

int dir_type(struct dir_s* d);
time_t dir_time(struct dir_s* d, int time_type);

#ifdef __cplusplus
}
#endif

#endif // _DIR_H__
/* dir_time.c */