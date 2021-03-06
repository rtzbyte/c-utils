#include "../linked_list.h"
#include "../alloc.h"
#include "../hashmap.h"

void*
hashmap_get(hashmap* map, void* key) {
  linked_list_node* node = hashmap_search(map, key);
  hashmap_pair* pair = node ? node->data : NULL;
  return pair ? pair->value : NULL;
}
