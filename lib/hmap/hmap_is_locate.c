#include "../hmap_internal.h"

int
hmap_is_locate(HMAP_DB* hmap_db, void* key, size_t k_len) {
  return hmap_search(hmap_db, key, k_len, NULL);
}

