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

gcc:   QMAKE_CFLAGS_WARN_ON = -Wno-unused -Wno-unused-but-set-variable

#mingw | mingw32 | mingw64 | msvc {
win32 | win64 {
  DEFINES += USE_READDIR=0

   msvc {
     LIBS += advapi32.lib ws2_32.lib wsock32.lib
   } else {
    LIBS += -ladvapi32 -lws2_32 -lwsock32
  }
} else {
   DEFINES += USE_READDIR=1
}

#win32|win64|msvc|mingw32:CONFIG(release, debug|release):  LIBS += -ladvapi32 -lws2_32

mingw | mingw32 | mingw64 {
  QMAKE_LFLAGS += -static-libgcc -static-libstdc++
}

!*msvc* {
  DEFINES += INLINE=inline

  #!*mingw*: DEFINES += USE_READDIR=1

gcc: QMAKE_CFLAGS_WARN_ON += -Wno-sign-compare -Wno-unused-parameter -Wno-unused-but-set-variable
}

INCLUDEPATH += .

HEADERS = ../../lib/buffer.h ../../lib/byte.h ../../lib/case.h ../../lib/dns.h ../../lib/errmsg.h ../../lib/fmt.h ../../lib/http.h ../../lib/iarray.h ../../lib/io.h ../../lib/ndelay.h ../../lib/open.h ../../lib/scan.h ../../lib/socket.h ../../lib/str.h ../../lib/stralloc.h ../../lib/tai.h ../../lib/taia.h ../../lib/uint16.h ../../lib/uint32.h
SOURCES = ../../httptest.c ../../lib/buffer/buffer_1.c ../../lib/buffer/buffer_2.c ../../lib/buffer/buffer_dummyread.c ../../lib/buffer/buffer_dummyreadmmap.c ../../lib/buffer/buffer_dump.c ../../lib/buffer/buffer_feed.c ../../lib/buffer/buffer_flush.c ../../lib/buffer/buffer_free.c ../../lib/buffer/buffer_freshen.c ../../lib/buffer/buffer_getc.c ../../lib/buffer/buffer_put.c ../../lib/buffer/buffer_putc.c ../../lib/buffer/buffer_putflush.c ../../lib/buffer/buffer_putlong.c ../../lib/buffer/buffer_putlonglong.c ../../lib/buffer/buffer_putm_internal.c ../../lib/buffer/buffer_putnlflush.c ../../lib/buffer/buffer_putnspace.c ../../lib/buffer/buffer_putptr.c ../../lib/buffer/buffer_puts.c ../../lib/buffer/buffer_putsa.c ../../lib/buffer/buffer_putspace.c ../../lib/buffer/buffer_putulong.c ../../lib/buffer/buffer_putulong0.c ../../lib/buffer/buffer_read_fd.c ../../lib/buffer/buffer_stubborn.c ../../lib/buffer/buffer_stubborn2.c ../../lib/buffer/buffer_write_fd.c ../../lib/byte/byte_chr.c ../../lib/byte/byte_copy.c ../../lib/byte/byte_diff.c ../../lib/byte/byte_equal.c ../../lib/byte/byte_fill.c ../../lib/byte/byte_zero.c ../../lib/case/case_diffb.c ../../lib/dns/dns_dfd.c ../../lib/dns/dns_domain.c ../../lib/dns/dns_ip4.c ../../lib/dns/dns_packet.c ../../lib/dns/dns_random.c ../../lib/dns/dns_rcip.c ../../lib/dns/dns_resolve.c ../../lib/dns/dns_sortip.c ../../lib/dns/dns_transmit.c ../../lib/errmsg/errmsg_iam.c ../../lib/errmsg/errmsg_puts.c ../../lib/errmsg/errmsg_warnsys.c ../../lib/errmsg/errmsg_write.c ../../lib/fmt/fmt_long.c ../../lib/fmt/fmt_longlong.c ../../lib/fmt/fmt_ulong.c ../../lib/fmt/fmt_ulonglong.c ../../lib/fmt/fmt_xlonglong.c ../../lib/http/http_get.c ../../lib/http/http_init.c ../../lib/http/http_read.c ../../lib/http/http_sendreq.c ../../lib/http/http_socket.c ../../lib/iarray/iarray_allocate.c ../../lib/iarray/iarray_get.c ../../lib/iarray/iarray_init.c ../../lib/iarray/iarray_length.c ../../lib/io/io_canread.c ../../lib/io/io_canwrite.c ../../lib/io/io_dontwantread.c ../../lib/io/io_dontwantwrite.c ../../lib/io/io_fd.c ../../lib/io/io_tryread.c ../../lib/io/io_waituntil2.c ../../lib/io/io_wantread.c ../../lib/io/io_wantwrite.c ../../lib/io/iopause.c ../../lib/ndelay/ndelay_off.c ../../lib/ndelay/ndelay_on.c ../../lib/open/open_read.c ../../lib/open/open_temp.c ../../lib/scan/scan_eolskip.c ../../lib/scan/scan_fromhex.c ../../lib/scan/scan_ulong.c ../../lib/scan/scan_ulonglong.c ../../lib/scan/scan_ulongn.c ../../lib/scan/scan_xlong.c ../../lib/scan/scan_xlonglong.c ../../lib/socket/fmt_ip4.c ../../lib/socket/scan_ip4.c ../../lib/socket/scan_ip6.c ../../lib/socket/socket_bind4.c ../../lib/socket/socket_bind6.c ../../lib/socket/socket_connect4.c ../../lib/socket/socket_connect6.c ../../lib/socket/socket_connected.c ../../lib/socket/socket_ip4loopback.c ../../lib/socket/socket_noipv6.c ../../lib/socket/socket_tcp4.c ../../lib/socket/socket_tcp4b.c ../../lib/socket/socket_tcp6.c ../../lib/socket/socket_tcp6b.c ../../lib/socket/socket_udp6.c ../../lib/socket/socket_v4mappedprefix.c ../../lib/socket/socket_v6any.c ../../lib/socket/socket_v6loopback.c ../../lib/str/str_chr.c ../../lib/str/str_copy.c ../../lib/str/str_find.c ../../lib/str/str_findb.c ../../lib/str/str_len.c ../../lib/stralloc/buffer_get_token_sa.c ../../lib/stralloc/buffer_getline_sa.c ../../lib/stralloc/openreadclose.c ../../lib/stralloc/readclose.c ../../lib/stralloc/stralloc_append.c ../../lib/stralloc/stralloc_catb.c ../../lib/stralloc/stralloc_contains.c ../../lib/stralloc/stralloc_copyb.c ../../lib/stralloc/stralloc_copys.c ../../lib/stralloc/stralloc_findb.c ../../lib/stralloc/stralloc_finds.c ../../lib/stralloc/stralloc_init.c ../../lib/stralloc/stralloc_nul.c ../../lib/stralloc/stralloc_ready.c ../../lib/stralloc/stralloc_readyplus.c ../../lib/stralloc/stralloc_startb.c ../../lib/stralloc/stralloc_starts.c ../../lib/stralloc/stralloc_trim.c ../../lib/stralloc/stralloc_zero.c ../../lib/tai/tai_pack.c ../../lib/taia/taia_add.c ../../lib/taia/taia_approx.c ../../lib/taia/taia_frac.c ../../lib/taia/taia_less.c ../../lib/taia/taia_now.c ../../lib/taia/taia_pack.c ../../lib/taia/taia_sub.c ../../lib/taia/taia_uint.c ../../lib/uint16/uint16_pack_big.c ../../lib/uint16/uint16_unpack_big.c ../../lib/uint32/uint32_prng.c ../../lib/uint32/uint32_random.c ../../lib/uint32/uint32_seed.c



DISTFILES +=

DEFINES += HAVE_ERRNO_H=1

unix | linux {
  DEFINES += LIBC_HAS_IP6=1
}
DEFINES += USE_SELECT=1
DEFINES += DEBUG=1

gcc {
gcc: QMAKE_CFLAGS_WARN_ON += -Wno-unused-variable -Wno-unused-parameter -Wno-unused-but-set-variable
}
