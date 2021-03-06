TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

*msvc* {
  DEFINES += INLINE=__inline
  DEFINES += _CRT_NONSTDC_NO_DEPRECATE=1
  DEFINES += _CRT_SECURE_NO_WARNINGS=1

  QMAKE_CFLAGS_WARN_ON = -W3
}

debug {
  DEFINES += DEBUG=1
}

win32 | win64 | msvc {
  WIDECHAR = 1
} else {
WIDECHAR = 0
}
DEFINES += USE_WIDECHAR=$$WIDECHAR

win32 | win64 | mingw32 | mingw64 {
  READDIR = 0
} else {
  READDIR = 1
}
DEFINES += USE_READDIR=$$READDIR

#win32|win64|msvc|mingw32:CONFIG(release, debug|release):  LIBS += -ladvapi32 -lws2_32
msvc: LIBS += advapi32.lib ws2_32.lib
mingw32|mingw64: LIBS += -ladvapi32 -lws2_32

mingw | mingw32 | mingw64 {
  QMAKE_LFLAGS += -static-libgcc -static-libstdc++
}

!*msvc* {
  DEFINES += INLINE=inline


gcc: QMAKE_CFLAGS_WARN_ON += -Wno-sign-compare -Wno-unused-variable -Wno-unused-parameter -Wno-unused-but-set-variable
}

INCLUDEPATH += .

HEADERS = ../../lib/buffer.h ../../lib/byte.h ../../lib/dir.h ../../lib/rdir.h ../../lib/str.h ../../lib/stralloc.h

SOURCES = ../../lib/buffer/buffer_1.c ../../lib/buffer/buffer_flush.c ../../lib/buffer/buffer_put.c ../../lib/buffer/buffer_putm_internal.c ../../lib/buffer/buffer_puts.c ../../lib/buffer/buffer_stubborn.c ../../lib/byte/byte_copy.c ../../lib/byte/byte_zero.c ../../lib/dir/dir_close.c ../../lib/dir/dir_open.c ../../lib/dir/dir_read.c ../../lib/dir/dir_type.c ../../lib/rdir/rdir_close.c ../../lib/rdir/rdir_open.c ../../lib/rdir/rdir_read.c ../../lib/str/str_diff.c ../../lib/str/str_len.c ../../lib/stralloc/stralloc_catb.c ../../lib/stralloc/stralloc_catc.c ../../lib/stralloc/stralloc_cats.c ../../lib/stralloc/stralloc_copyb.c ../../lib/stralloc/stralloc_copys.c ../../lib/stralloc/stralloc_free.c ../../lib/stralloc/stralloc_init.c ../../lib/stralloc/stralloc_nul.c ../../lib/stralloc/stralloc_ready.c ../../lib/stralloc/stralloc_readyplus.c ../../lib/unix/fnmatch.c ../../rdir-test.c
