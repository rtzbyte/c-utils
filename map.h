#ifndef _MAP_H
#define _MAP_H

#if 0
#include "lib/hashmap.h"
#include "lib/linked_list.h"
#include "lib/alloc.h"
#include "lib/uint32.h"
#include "lib/uint64.h"
#include "lib/byte.h"
#include "lib/str.h"

typedef hashmap MAP_T;
typedef hashmap_pair* MAP_PAIR_T;
typedef linked_list_node* MAP_NODE_T;

#define MAP_SIZE(map) hashmap_size(&(map))
#define MAP_NEW(map) hashmap_init(&(map), 64, MAP_COMPARATOR, &hashfunc)
#define MAP_GET(map, key, klen) hashmap_get(&(map), (void*)(key))
#define MAP_DESTROY(map) hashmap_free(&(map))
#define MAP_FOREACH(map, iter)                                                                                         \
  for(linked_list_node* node = linked_list_head(hashmap_keys(&(map)));                                                 \
      (iter = node ? hashmap_getpair(hashmap_search(&(map), node->data)) : 0);                                         \
      node = node->next)
#define MAP_KEY(pair) ((char*)(pair)->key)
#define MAP_DATA(iter) ((MAP_PAIR_T)(iter)->data)
#define MAP_VALUE(pair) ((pair) ? (void*)(((MAP_PAIR_T)(pair))->value) : 0)
#define MAP_DELETE(map, key, klen) hashmap_remove(&(map), (void*)(key))
#define MAP_SEARCH(map, key, klen, pair) (*(pair) = hashmap_getpair(hashmap_search(&(map), (void*)(key))))

static MAP_PAIR_T
hashmap_getpair(linked_list_node* node) {
  return node ? node->data : NULL;
}

#define MAP_SET(map, key, value) MAP_INSERT(map, (key), str_len(key) + 1, (value), str_len(value) + 1)
#define MAP_VISIT_ALL(map, fn, arg)                                                                                    \
  {                                                                                                                    \
    MAP_PAIR_T t;                                                                                                      \
    MAP_FOREACH(map, t) fn(MAP_KEY(t), str_len(MAP_KEY(t)), MAP_VALUE(t), 0, arg);                                     \
  }

#define MAP_INSERT(map, key, klen, data, dlen) hashmap_insert(&(map), (void*)(key), klen, (void*)(data), dlen)

static linked_list_node*
hashmap_insert(MAP_T* map, void* key, size_t klen, void* data, size_t dlen) {
  char *k, *v;
  klen = (klen > 0 && ((char*)key)[klen - 1] == '\0') ? klen : klen + 1;
  k = alloc(klen);
  byte_copy(k, klen, key);
  dlen = (dlen > 0 && ((char*)data)[dlen - 1] == '\0') ? dlen : dlen + 1;
  v = alloc(dlen + sizeof(size_t));
  byte_copy(v + sizeof(size_t), dlen, data);

  *((size_t*)(v)) = dlen;

  hashmap_put(map, k, v + sizeof(size_t));
}
#define MAP_DUMP(map, buf)

#define HASH_TYPE uint64
#define HASH_BITS (sizeof(HASH_TYPE) * 8)
#define HASH_MASK (HASH_BITS - 1)
#define HASH_HALF (HASH_BITS / 2)

#define ROR(v, c) v = (((v) >> c) | (v) << (HASH_BITS - c))
#define ROL(v, c) v = (((v) << c) | (v) >> (HASH_BITS - c))

static size_t
hashfunc(const void* str, size_t capacity) {
  uint64 hash;
  int rotate;
  uint32 a = 0;
  uint32 b = 0;
  const unsigned char* v = (const unsigned char*)str;
  const unsigned char* p = (const unsigned char*)v;

  static uint32 seeds[] = {
      0x2e8b1c8a,
      0xa8fa6d8c,
      0x20c91d6c,
      0x9625e261,
      0xbbe5d3ae,
      0x0b67aab9,
      0xaeabca3b,
      0xb0a3595a,
      0x8898bba8,
      0xe164242e,
      0xf85afdd0,
      0x49d7d461,
      0xcec21aa0,
      0x5c77fd0d,
      0xd011e8ec,
      0x6bfb5d73,
  };

  hash = 0;

  do {
    a ^= *v & 0x0f;
    b ^= *v >> 4;

    a -= seeds[b & 0x0f];
    b += seeds[a & 0x0f];
    rotate = a & HASH_MASK;
    hash -= (HASH_TYPE)b;
    ROL(hash, HASH_HALF);
    hash = +(HASH_TYPE)a;
    ROR(hash, rotate);

    a ^= seeds[b & 0x0f];
    b ^= seeds[a & 0x0f];
    rotate = b & HASH_MASK;
    hash ^= (HASH_TYPE)a;
    ROR(hash, HASH_HALF);
    hash ^= (HASH_TYPE)b;
    ROL(hash, rotate);

    b += seeds[a & 0x0f];
    a -= seeds[b & 0x0f];
    rotate = a & HASH_MASK;
    hash -= (HASH_TYPE)b;
    ROL(hash, HASH_HALF);
    hash = +(HASH_TYPE)a;
    ROR(hash, rotate);

    b ^= seeds[a & 0x0f];
    a ^= seeds[b & 0x0f];
    rotate = b & HASH_MASK;
    hash ^= (HASH_TYPE)a;
    ROR(hash, HASH_HALF);
    hash ^= (HASH_TYPE)b;
    ROL(hash, rotate);
  } while(*++v && *v != '\0');

  return hash % capacity;
}

static int
MAP_COMPARATOR(const void* l, const void* r) {
  return str_diff(l, r);
  /*size_t lsz = *(((size_t*)l)-1);
  size_t rsz = *(((size_t*)r)-1);

  if(lsz != rsz)
    return (ssize_t)lsz   - (ssize_t)rsz;

  return byte_diff(l, lsz, r);*/
}

#else
#include "lib/hmap.h"

typedef HMAP_DB* MAP_T;
typedef TUPLE* MAP_PAIR_T;
typedef TUPLE* MAP_NODE_T;

#define MAP_SIZE hmap_size
#define MAP_NEW(map) hmap_init(MAP_BUCKET, &(map))
#define MAP_DESTROY(map) ((map) ? hmap_destroy(&(map)) : (void)0)
#define MAP_DATA hmap_data
#define MAP_FOREACH(map, iter) hmap_foreach(map, iter)
#define MAP_VALUE(iter) ((void*)((iter)->vals.val_custom))
#define MAP_VISIT_ALL(map, fn, arg)                                                                                    \
  {                                                                                                                    \
    TUPLE* t;                                                                                                          \
    hmap_foreach(map, t) fn(t->key, t->key_len, t->vals.val_chars, t->data_len, arg);                                  \
  }
#define MAP_GET(map, key, klen) hmap_get(map, key, klen)
/*static inline void*
MAP_GET(HMAP_DB* map, const void* key, size_t klen) {
  TUPLE* t = NULL;
  if(hmap_search(map, key, klen, &t) == HMAP_SUCCESS) {
    if(t->data_type == HMAP_DATA_TYPE_CUSTOM)
      return t->vals.val_custom;

    return t->vals.val_chars;
  }

  return NULL;
}*/

#define MAP_DUMP hmap_dump
#define MAP_DELETE(map, key, klen) hmap_delete(&(map), key, klen)
#define MAP_SET(map, key, value) MAP_INSERT(map, (key), str_len(key) + 1, (value), str_len(value) + 1)
#define MAP_INSERT(map, key, klen, data, dlen)                                                                         \
  (dlen == 0 ? hmap_add(&(map), key, klen, 0, HMAP_DATA_TYPE_CUSTOM, data) : hmap_set(&(map), key, klen, data, dlen))
#define MAP_SEARCH(map, key, klen, tuple) (hmap_search(map, key, klen, tuple) == HMAP_SUCCESS ? *(tuple) : 0)
#define MAP_KEY(tuple) ((char*)(tuple)->key)

#endif

#endif /* defined _MAP_H */
