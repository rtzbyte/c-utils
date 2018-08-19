#include "../xml.h"
#include "../str.h"
#include "../fmt.h"

void
xml_set_attribute_double(xmlnode* node, const char* a, double d) {
  char buf[64];
  size_t n = fmt_double(buf, d, sizeof(buf)-1, 15);

  if(byte_chr(buf, n, '.') < n) {
    while(n > 0 && buf[n - 1] == '0') --n;
    if(n > 0 && buf[n - 1] == '.')--n;
  }
  buf[n] = '\0';
  xml_set_attribute(node, a, buf);
}
