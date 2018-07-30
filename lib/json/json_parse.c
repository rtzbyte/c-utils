#include "../charbuf.h"
#include "../json.h"
#include <ctype.h>

int
json_parse_array(jsonval* j, charbuf* b) {
  j->type = JSON_ARRAY;
}

int
json_parse_object(jsonval* j, charbuf* b) {
  j->type = JSON_OBJECT;
}
int
json_parse_string(jsonval* j, charbuf* b) {
  j->type = JSON_STRING;
}
int
json_parse(jsonval* j, charbuf* b) {

	int c;
  charbuf_skip_pred(b, &isspace);
  c = charbuf_peek(b);

  if(c == '[') return json_parse_array(j, b);
  else if(c == '{') return json_parse_object(j, b);
  else if(c == '"' ) return json_parse_string(j, b);
}