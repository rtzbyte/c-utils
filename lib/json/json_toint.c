#include "../stralloc.h"
#include "../scan.h"
#include "../json.h"
#include "../uint64.h"

int64
json_toint(jsonval val) {
  int64 ret;
  stralloc sa;
  stralloc_init(&sa);
  json_tostring(val, &sa);
  stralloc_nul(&sa);
  if(!scan_longlong(sa.s, &ret))
    ret = -1;

  stralloc_free(&sa);
  return ret;
}
