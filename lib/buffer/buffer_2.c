#include "../buffer.h"
#include "../windoze.h"

#if WINDOWS_NATIVE
#include <io.h>
#else
#include <unistd.h>
#endif

char buffer_2_space[BUFFER_INSIZE];
static buffer it = BUFFER_INIT(write, 2, buffer_2_space, sizeof buffer_2_space);
buffer* buffer_2 = &it;

