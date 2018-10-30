TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

QMAKE_CXX = gcc

*msvc* {
  DEFINES += INLINE=__inline
  DEFINES += _CRT_NONSTDC_NO_DEPRECATE=1
  DEFINES += _CRT_SECURE_NO_WARNINGS=1

  QMAKE_CFLAGS_WARN_ON = -W3
}

#mingw | mingw32 | mingw64 | msvc {
win32 | winn64 {
  DEFINES += USE_READDIR=0

} else {
   DEFINES += USE_READDIR=1
}

#win32|win64|msvc|mingw32:CONFIG(release, debug|release):  LIBS += -ladvapi32 -lws2_32
msvc: LIBS += advapi32.lib ws2_32.lib
mingw32|mingw64: LIBS += -ladvapi32 -lws2_32

mingw | mingw32 | mingw64 {
  QMAKE_LFLAGS += -static-libgcc -static-libstdc++
}

!*msvc* {
  DEFINES += INLINE=inline

  #!*mingw*: DEFINES += USE_READDIR=1

  #QMAKE_CFLAGS_WARN_ON += -Wno-sign-compare -Wno-unused-parameter
}

INCLUDEPATH += .

HEADERS = lib/array.h


DEFINES += HAVE_ERRNO_H=1

SOURCES = genmakefile.c lib/array/array_allocate.c lib/array/array_catb.c lib/array/array_fail.c lib/array/array_length.c lib/array/array_start.c lib/array/umult64.c lib/buffer/buffer_1.c lib/buffer/buffer_2.c lib/buffer/buffer_flush.c lib/buffer/buffer_put.c lib/buffer/buffer_putc.c lib/buffer/buffer_putflush.c lib/buffer/buffer_putm_internal.c lib/buffer/buffer_putnlflush.c lib/buffer/buffer_puts.c lib/buffer/buffer_putsa.c lib/buffer/buffer_putspace.c lib/buffer/buffer_putulong.c lib/buffer/buffer_stubborn.c lib/byte/byte_chr.c lib/byte/byte_copy.c lib/byte/byte_diff.c lib/byte/byte_equal.c lib/byte/byte_findb.c lib/byte/byte_finds.c lib/byte/byte_upper.c lib/byte/byte_zero.c lib/dir/dir_close.c lib/dir/dir_name.c lib/dir/dir_open.c lib/dir/dir_read.c lib/dir/dir_type.c lib/fmt/fmt_ulong.c lib/hmap/hmap_add.c lib/hmap/hmap_destroy.c lib/hmap/hmap_free_data.c lib/hmap/hmap_get.c lib/hmap/hmap_init.c lib/hmap/hmap_search.c lib/hmap/hmap_set.c lib/hmap/hmap_truncate.c lib/mmap/mmap_read.c lib/mmap/mmap_unmap.c lib/path/path_dirname.c lib/rdir/rdir_open.c lib/rdir/rdir_read.c lib/scan/scan_whitenskip.c lib/str/str_basename.c lib/str/str_chr.c lib/str/str_diff.c lib/str/str_diffn.c lib/str/str_dup.c lib/str/str_end.c lib/str/str_find.c lib/str/str_findb.c lib/str/str_len.c lib/str/str_ndup.c lib/str/str_rchr.c lib/str/str_rchrs.c lib/str/str_start.c lib/stralloc/stralloc_append.c lib/stralloc/stralloc_cat.c lib/stralloc/stralloc_catb.c lib/stralloc/stralloc_catc.c lib/stralloc/stralloc_cats.c lib/stralloc/stralloc_copyb.c lib/stralloc/stralloc_copys.c lib/stralloc/stralloc_endb.c lib/stralloc/stralloc_free.c lib/stralloc/stralloc_init.c lib/stralloc/stralloc_nul.c lib/stralloc/stralloc_ready.c lib/stralloc/stralloc_readyplus.c lib/stralloc/stralloc_zero.c lib/stralloc/utf8.c lib/strarray/strarray_push.c lib/strlist/strlist_append_sa.c lib/strlist/strlist_at.c lib/strlist/strlist_at_n.c lib/strlist/strlist_at_sa.c lib/strlist/strlist_cat.c lib/strlist/strlist_contains.c lib/strlist/strlist_contains_sa.c lib/strlist/strlist_count.c lib/strlist/strlist_dump.c lib/strlist/strlist_froms.c lib/strlist/strlist_index_of.c lib/strlist/strlist_indexofb.c lib/strlist/strlist_join.c lib/strlist/strlist_joins.c lib/strlist/strlist_pop.c lib/strlist/strlist_prepend_sa.c lib/strlist/strlist_prependb.c lib/strlist/strlist_prepends.c lib/strlist/strlist_push.c lib/strlist/strlist_push_sa.c lib/strlist/strlist_push_tokens.c lib/strlist/strlist_push_unique.c lib/strlist/strlist_push_unique_sa.c lib/strlist/strlist_pushb.c lib/strlist/strlist_pushb_unique.c lib/strlist/strlist_pushm_internal.c lib/strlist/strlist_range.c lib/strlist/strlist_shift.c lib/strlist/strlist_shift_n.c lib/strlist/strlist_sort.c lib/strlist/strlist_to_argv.c lib/strlist/strlist_unshift.c lib/unix/getopt.c
