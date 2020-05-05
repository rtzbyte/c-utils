$(BUILDDIR)gzread.o: CPPFLAGS += -I3rdparty/zlib
$(BUILDDIR)gzread.o: 3rdparty/zlib/gzread.c 3rdparty/zlib/gzguts.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)e_os.h.o: CPPFLAGS += -I3rdparty/openssl/include/internal
$(BUILDDIR)e_os.h.o: 3rdparty/openssl/e_os.h 3rdparty/openssl/include/internal/nelem.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)cryptlib.h.o: CPPFLAGS += -I3rdparty/openssl/include/crypto
$(BUILDDIR)cryptlib.h.o: 3rdparty/openssl/include/crypto/cryptlib.h 3rdparty/openssl/include/crypto/cryptlib.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)cryptlib.h.o: CPPFLAGS += -I3rdparty/openssl/ms
$(BUILDDIR)cryptlib.h.o: 3rdparty/openssl/include/internal/cryptlib.h 3rdparty/openssl/ms/uplink.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)pkcs12.o: CPPFLAGS += -I3rdparty/openssl/apps
$(BUILDDIR)pkcs12.o: 3rdparty/openssl/apps/pkcs12.c 3rdparty/openssl/apps/apps.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)apps.h.o: CPPFLAGS += -I3rdparty/openssl
$(BUILDDIR)apps.h.o: 3rdparty/openssl/apps/apps.h 3rdparty/openssl/e_os.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)srptest.o: CPPFLAGS += -I3rdparty/openssl/test
$(BUILDDIR)srptest.o: 3rdparty/openssl/test/srptest.c 3rdparty/openssl/test/testutil.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)cb.o: CPPFLAGS += -I3rdparty/openssl/test/testutil
$(BUILDDIR)cb.o: 3rdparty/openssl/test/testutil/cb.c 3rdparty/openssl/test/testutil/output.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)s3_msg.o: CPPFLAGS += -I3rdparty/openssl/ssl
$(BUILDDIR)s3_msg.o: 3rdparty/openssl/ssl/s3_msg.c 3rdparty/openssl/ssl/ssl_local.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)ssl_local.h.o: CPPFLAGS += -I3rdparty/openssl/ssl/record -I3rdparty/openssl/ssl/statem
$(BUILDDIR)ssl_local.h.o: 3rdparty/openssl/ssl/ssl_local.h 3rdparty/openssl/ssl/record/record.h 3rdparty/openssl/ssl/statem/statem.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)eng_cnf.o: CPPFLAGS += -I3rdparty/openssl/crypto/engine
$(BUILDDIR)eng_cnf.o: 3rdparty/openssl/crypto/engine/eng_cnf.c 3rdparty/openssl/crypto/engine/eng_local.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)eng_local.h.o: CPPFLAGS += -I3rdparty/openssl/include/openssl
$(BUILDDIR)eng_local.h.o: 3rdparty/openssl/crypto/engine/eng_local.h 3rdparty/openssl/include/openssl/engine.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)sha1dgst.o: CPPFLAGS += -I3rdparty/openssl/crypto/sha
$(BUILDDIR)sha1dgst.o: 3rdparty/openssl/crypto/sha/sha1dgst.c 3rdparty/openssl/crypto/sha/sha_local.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)async.o: CPPFLAGS += -I3rdparty/openssl/crypto/async
$(BUILDDIR)async.o: 3rdparty/openssl/crypto/async/async.c 3rdparty/openssl/crypto/async/async_local.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)gcm128.o: CPPFLAGS += -I3rdparty/openssl/crypto
$(BUILDDIR)gcm128.o: 3rdparty/openssl/crypto/modes/gcm128.c 3rdparty/openssl/crypto/arm_arch.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)ct_x509v3.o: CPPFLAGS += -I3rdparty/openssl/crypto/ct
$(BUILDDIR)ct_x509v3.o: 3rdparty/openssl/crypto/ct/ct_x509v3.c 3rdparty/openssl/crypto/ct/ct_local.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)e_camellia.o: CPPFLAGS += -I3rdparty/openssl/crypto/modes
$(BUILDDIR)e_camellia.o: 3rdparty/openssl/crypto/evp/e_camellia.c 3rdparty/openssl/crypto/modes/modes_local.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)p5_crpt2.o: CPPFLAGS += -I3rdparty/openssl/crypto/evp
$(BUILDDIR)p5_crpt2.o: 3rdparty/openssl/crypto/evp/p5_crpt2.c 3rdparty/openssl/crypto/evp/evp_local.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)seed.o: CPPFLAGS += -I3rdparty/openssl/crypto/seed
$(BUILDDIR)seed.o: 3rdparty/openssl/crypto/seed/seed.c 3rdparty/openssl/crypto/seed/seed_local.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)dso_dl.o: CPPFLAGS += -I3rdparty/openssl/crypto/dso
$(BUILDDIR)dso_dl.o: 3rdparty/openssl/crypto/dso/dso_dl.c 3rdparty/openssl/crypto/dso/dso_local.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

$(BUILDDIR)dh_meth.o: CPPFLAGS += -I3rdparty/openssl/crypto/dh
$(BUILDDIR)dh_meth.o: 3rdparty/openssl/crypto/dh/dh_meth.c 3rdparty/openssl/crypto/dh/dh_local.h
  $(CROSS_COMPILE)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) $(INCLUDES) $(DEFS) -c -o $@ $<

