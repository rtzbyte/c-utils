CC = c:/BCC/bin/bcc32c.exe
LINK = ilink32
CCLD = $(CC)
AR = ar
CFLAGS = -O
CPPFLAGS = 
BUILDDIR = build/bcc/Debug/

#ALIGNED_ALLOC =
#ALLOCA =
#BSDSENDFILE =
#C11_GENERICS =
#CYGWIN_CONV_PATH =
#DEVPOLL =
#DYNSTACK =
#EAGAIN_READWRITE =
#EPOLL =
#FNMATCHGETDELIM =
#GETOPT =
#GETOPT_LONG =
#GLOB =
#IO_FD_FLAGS =
#IO_QUEUEFORREAD =
#KQUEUE =
#LIBBZ2 =
#LIBLZMA =
#LIBZ =
#LOCALTIME_R =
#LSTAT =
#N2I =
#PIPE2 =
#POPEN =
#POSIX_MEMALIGN =
#PREAD =
#ROUND =
#SENDFILE =
#SIGIO =
#SOCKET_FASTOPEN =
#UINT128 =
#WORDEXP =
#ZLIB =
#STDINT_H =
#ALLOCA_H =
#CONFIG_H =
#ERRNO_H =
#INTTYPES_H =
#LINUX_LIMITS_H =


all: $(BUILDDIR) $(BUILDDIR)binfmttest$(EXEEXT) $(BUILDDIR)bsdiffcat$(EXEEXT) $(BUILDDIR)buffertest$(EXEEXT) $(BUILDDIR)ccat$(EXEEXT) $(BUILDDIR)compiler-wrapper$(EXEEXT) $(BUILDDIR)count-depth$(EXEEXT) $(BUILDDIR)decode-ls-lR$(EXEEXT) $(BUILDDIR)dnsip$(EXEEXT) $(BUILDDIR)dnsname$(EXEEXT) $(BUILDDIR)dnstest$(EXEEXT) $(BUILDDIR)eagle-gen-cmds$(EXEEXT) $(BUILDDIR)eagle-init-brd$(EXEEXT) $(BUILDDIR)eagle-to-circuit$(EXEEXT) $(BUILDDIR)elf64list$(EXEEXT) $(BUILDDIR)elflist$(EXEEXT) $(BUILDDIR)elfwrsec$(EXEEXT) $(BUILDDIR)genmakefile$(EXEEXT) $(BUILDDIR)hexedit$(EXEEXT) $(BUILDDIR)httptest$(EXEEXT) $(BUILDDIR)impgen$(EXEEXT) $(BUILDDIR)jsontest$(EXEEXT) $(BUILDDIR)list-r$(EXEEXT) $(BUILDDIR)macho32list$(EXEEXT) $(BUILDDIR)mediathek-list$(EXEEXT) $(BUILDDIR)mediathek-parser$(EXEEXT) $(BUILDDIR)ntldd$(EXEEXT) $(BUILDDIR)opensearch-dump$(EXEEXT) $(BUILDDIR)pathtool$(EXEEXT) $(BUILDDIR)pelist$(EXEEXT) $(BUILDDIR)pkgcfg$(EXEEXT) $(BUILDDIR)plsconv$(EXEEXT) $(BUILDDIR)rdir-test$(EXEEXT) $(BUILDDIR)reg2cmd$(EXEEXT) $(BUILDDIR)regfilter$(EXEEXT) $(BUILDDIR)sln$(EXEEXT) $(BUILDDIR)strarraytest$(EXEEXT) $(BUILDDIR)torrent-progress$(EXEEXT) $(BUILDDIR)xmlpp$(EXEEXT) $(BUILDDIR)xmltest$(EXEEXT) $(BUILDDIR)xmltest2$(EXEEXT) $(BUILDDIR)xmltest3$(EXEEXT) $(BUILDDIR)xmltest4$(EXEEXT) $(BUILDDIR)ziptest$(EXEEXT)

$(BUILDDIR):
	@mkdir -p $@ || mkdir $@

$(BUILDDIR)binfmttest$(EXEEXT) $(BUILDDIR)bsdiffcat$(EXEEXT) $(BUILDDIR)buffertest$(EXEEXT) $(BUILDDIR)ccat$(EXEEXT) $(BUILDDIR)compiler-wrapper$(EXEEXT) $(BUILDDIR)count-depth$(EXEEXT) $(BUILDDIR)decode-ls-lR$(EXEEXT) $(BUILDDIR)dnsip$(EXEEXT) $(BUILDDIR)dnsname$(EXEEXT) $(BUILDDIR)dnstest$(EXEEXT) $(BUILDDIR)eagle-gen-cmds$(EXEEXT) $(BUILDDIR)eagle-init-brd$(EXEEXT) $(BUILDDIR)eagle-to-circuit$(EXEEXT) $(BUILDDIR)elf64list$(EXEEXT) $(BUILDDIR)elflist$(EXEEXT) $(BUILDDIR)elfwrsec$(EXEEXT) $(BUILDDIR)genmakefile$(EXEEXT) $(BUILDDIR)hexedit$(EXEEXT) $(BUILDDIR)httptest$(EXEEXT) $(BUILDDIR)impgen$(EXEEXT) $(BUILDDIR)jsontest$(EXEEXT) $(BUILDDIR)list-r$(EXEEXT) $(BUILDDIR)macho32list$(EXEEXT) $(BUILDDIR)mediathek-list$(EXEEXT) $(BUILDDIR)mediathek-parser$(EXEEXT) $(BUILDDIR)ntldd$(EXEEXT) $(BUILDDIR)opensearch-dump$(EXEEXT) $(BUILDDIR)pathtool$(EXEEXT) $(BUILDDIR)pelist$(EXEEXT) $(BUILDDIR)pkgcfg$(EXEEXT) $(BUILDDIR)plsconv$(EXEEXT) $(BUILDDIR)rdir-test$(EXEEXT) $(BUILDDIR)reg2cmd$(EXEEXT) $(BUILDDIR)regfilter$(EXEEXT) $(BUILDDIR)sln$(EXEEXT) $(BUILDDIR)strarraytest$(EXEEXT) $(BUILDDIR)torrent-progress$(EXEEXT) $(BUILDDIR)xmlpp$(EXEEXT) $(BUILDDIR)xmltest$(EXEEXT) $(BUILDDIR)xmltest2$(EXEEXT) $(BUILDDIR)xmltest3$(EXEEXT) $(BUILDDIR)xmltest4$(EXEEXT) $(BUILDDIR)ziptest$(EXEEXT): $(BUILDDIR)%$(EXEEXT): $(BUILDDIR)%.obj $(BUILDDIR)array.a $(BUILDDIR)binfmt.a $(BUILDDIR)buffer.a $(BUILDDIR)byte.a $(BUILDDIR)case.a $(BUILDDIR)cb.a $(BUILDDIR)cbmap.a $(BUILDDIR)charbuf.a $(BUILDDIR)dir.a $(BUILDDIR)dns.a $(BUILDDIR)elf.a $(BUILDDIR)env.a $(BUILDDIR)errmsg.a $(BUILDDIR)expand.a $(BUILDDIR)fmt.a $(BUILDDIR)gpio.a $(BUILDDIR)hmap.a $(BUILDDIR)http.a $(BUILDDIR)iarray.a $(BUILDDIR)io.a $(BUILDDIR)json.a $(BUILDDIR)list.a $(BUILDDIR)map.a $(BUILDDIR)mmap.a $(BUILDDIR)ndelay.a $(BUILDDIR)open.a $(BUILDDIR)path.a $(BUILDDIR)pe.a $(BUILDDIR)playlist.a $(BUILDDIR)rdir.a $(BUILDDIR)scan.a $(BUILDDIR)sig.a $(BUILDDIR)slist.a $(BUILDDIR)socket.a $(BUILDDIR)str.a $(BUILDDIR)stralloc.a $(BUILDDIR)strarray.a $(BUILDDIR)strlist.a $(BUILDDIR)tai.a $(BUILDDIR)taia.a $(BUILDDIR)textbuf.a $(BUILDDIR)uint16.a $(BUILDDIR)uint32.a $(BUILDDIR)uint64.a $(BUILDDIR)var.a $(BUILDDIR)vartab.a $(BUILDDIR)xml.a
	$(CCLD) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)


$(BUILDDIR)access.obj $(BUILDDIR)binfmttest.obj $(BUILDDIR)bsdiffcat.obj $(BUILDDIR)buffertest.obj $(BUILDDIR)ccat.obj $(BUILDDIR)compiler-wrapper.obj $(BUILDDIR)count-depth.obj $(BUILDDIR)decode-ls-lR.obj $(BUILDDIR)dnsip.obj $(BUILDDIR)dnsname.obj $(BUILDDIR)dnstest.obj $(BUILDDIR)eagle-gen-cmds.obj $(BUILDDIR)eagle-init-brd.obj $(BUILDDIR)eagle-to-circuit.obj $(BUILDDIR)elf64list.obj $(BUILDDIR)elflist.obj $(BUILDDIR)elfwrsec.obj $(BUILDDIR)genmakefile.obj $(BUILDDIR)hexedit.obj $(BUILDDIR)httptest.obj $(BUILDDIR)impgen.obj $(BUILDDIR)jsontest.obj $(BUILDDIR)libntldd.obj $(BUILDDIR)list-r.obj $(BUILDDIR)macho32list.obj $(BUILDDIR)map.obj $(BUILDDIR)mediathek-list.obj $(BUILDDIR)mediathek-parser.obj $(BUILDDIR)ntldd.obj $(BUILDDIR)opensearch-dump.obj $(BUILDDIR)pathtool.obj $(BUILDDIR)pelist.obj $(BUILDDIR)pkgcfg.obj $(BUILDDIR)plsconv.obj $(BUILDDIR)rdir-test.obj $(BUILDDIR)reg2cmd.obj $(BUILDDIR)regfilter.obj $(BUILDDIR)sln.obj $(BUILDDIR)strarraytest.obj $(BUILDDIR)torrent-progress.obj $(BUILDDIR)xmlpp.obj $(BUILDDIR)xmltest.obj $(BUILDDIR)xmltest2.obj $(BUILDDIR)xmltest3.obj $(BUILDDIR)xmltest4.obj $(BUILDDIR)ziptest.obj: \
	 $(BUILDDIR)%.obj: %.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)fnmatch.obj $(BUILDDIR)fork.obj $(BUILDDIR)getdelim.obj $(BUILDDIR)getenv.obj $(BUILDDIR)getopt.obj $(BUILDDIR)glob.obj $(BUILDDIR)hashmap.obj $(BUILDDIR)iopause.obj $(BUILDDIR)io_passfd.obj $(BUILDDIR)isleap.obj $(BUILDDIR)linked_list.obj $(BUILDDIR)memalign.obj $(BUILDDIR)memory.obj $(BUILDDIR)pipe2.obj $(BUILDDIR)popen.obj $(BUILDDIR)readlink.obj $(BUILDDIR)round.obj $(BUILDDIR)setenv.obj $(BUILDDIR)strptime.obj $(BUILDDIR)symlink.obj $(BUILDDIR)time_table_spd.obj $(BUILDDIR)umult64.obj $(BUILDDIR)utf8.obj $(BUILDDIR)wordexp.obj: \
	 $(BUILDDIR)%.obj: lib/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)array_allocate.obj $(BUILDDIR)array_bytes.obj $(BUILDDIR)array_cat.obj $(BUILDDIR)array_cat0.obj $(BUILDDIR)array_catb.obj $(BUILDDIR)array_cate.obj $(BUILDDIR)array_cats.obj $(BUILDDIR)array_cats0.obj $(BUILDDIR)array_end.obj $(BUILDDIR)array_equal.obj $(BUILDDIR)array_fail.obj $(BUILDDIR)array_get.obj $(BUILDDIR)array_length.obj $(BUILDDIR)array_reset.obj $(BUILDDIR)array_start.obj $(BUILDDIR)array_trunc.obj $(BUILDDIR)array_truncate.obj: \
	 $(BUILDDIR)%.obj: lib/array/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)binfmt_open.obj: \
	 $(BUILDDIR)%.obj: lib/binfmt/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)buffer_0.obj $(BUILDDIR)buffer_0small.obj $(BUILDDIR)buffer_1.obj $(BUILDDIR)buffer_1small.obj $(BUILDDIR)buffer_2.obj $(BUILDDIR)buffer_bz2.obj $(BUILDDIR)buffer_bzip.obj $(BUILDDIR)buffer_close.obj $(BUILDDIR)buffer_copy.obj $(BUILDDIR)buffer_default.obj $(BUILDDIR)buffer_deflate.obj $(BUILDDIR)buffer_dummyread.obj $(BUILDDIR)buffer_dummyreadmmap.obj $(BUILDDIR)buffer_dump.obj $(BUILDDIR)buffer_feed.obj $(BUILDDIR)buffer_flush.obj $(BUILDDIR)buffer_free.obj $(BUILDDIR)buffer_freshen.obj $(BUILDDIR)buffer_fromarray.obj $(BUILDDIR)buffer_frombuf.obj $(BUILDDIR)buffer_fromsa.obj $(BUILDDIR)buffer_fromstr.obj $(BUILDDIR)buffer_get.obj $(BUILDDIR)buffer_getc.obj $(BUILDDIR)buffer_getline.obj $(BUILDDIR)buffer_getline_sa.obj $(BUILDDIR)buffer_getn.obj $(BUILDDIR)buffer_getnewline_sa.obj $(BUILDDIR)buffer_gettok_sa.obj $(BUILDDIR)buffer_get_new_token_sa.obj $(BUILDDIR)buffer_get_new_token_sa_pred.obj $(BUILDDIR)buffer_get_token.obj $(BUILDDIR)buffer_get_token_pred.obj $(BUILDDIR)buffer_get_token_sa.obj $(BUILDDIR)buffer_get_token_sa_pred.obj $(BUILDDIR)buffer_get_until.obj $(BUILDDIR)buffer_gzip.obj $(BUILDDIR)buffer_inflate.obj $(BUILDDIR)buffer_init.obj $(BUILDDIR)buffer_init_free.obj $(BUILDDIR)buffer_lzma.obj $(BUILDDIR)buffer_mmap.obj $(BUILDDIR)buffer_mmapprivate.obj $(BUILDDIR)buffer_mmapprivate_fd.obj $(BUILDDIR)buffer_mmapread.obj $(BUILDDIR)buffer_mmapread_fd.obj $(BUILDDIR)buffer_mmapshared_fd.obj $(BUILDDIR)buffer_munmap.obj $(BUILDDIR)buffer_peek.obj $(BUILDDIR)buffer_peekc.obj $(BUILDDIR)buffer_prefetch.obj $(BUILDDIR)buffer_put.obj $(BUILDDIR)buffer_put8long.obj $(BUILDDIR)buffer_putalign.obj $(BUILDDIR)buffer_putc.obj $(BUILDDIR)buffer_putdouble.obj $(BUILDDIR)buffer_puterror.obj $(BUILDDIR)buffer_puterror2.obj $(BUILDDIR)buffer_putflush.obj $(BUILDDIR)buffer_putlonglong.obj $(BUILDDIR)buffer_putlong.obj $(BUILDDIR)buffer_putlonglong.obj $(BUILDDIR)buffer_putm_internal.obj $(BUILDDIR)buffer_putm_internal_flush.obj $(BUILDDIR)buffer_putnc.obj $(BUILDDIR)buffer_putnlflush.obj $(BUILDDIR)buffer_putnspace.obj $(BUILDDIR)buffer_putptr.obj $(BUILDDIR)buffer_puts.obj $(BUILDDIR)buffer_putsa.obj $(BUILDDIR)buffer_putsaflush.obj $(BUILDDIR)buffer_putsalign.obj $(BUILDDIR)buffer_putsflush.obj $(BUILDDIR)buffer_putspace.obj $(BUILDDIR)buffer_putspad.obj $(BUILDDIR)buffer_puts_escaped.obj $(BUILDDIR)buffer_putulonglong.obj $(BUILDDIR)buffer_putulong.obj $(BUILDDIR)buffer_putulong0.obj $(BUILDDIR)buffer_putulonglong.obj $(BUILDDIR)buffer_putxlong.obj $(BUILDDIR)buffer_putxlong0.obj $(BUILDDIR)buffer_putxlonglong.obj $(BUILDDIR)buffer_putxlonglong0.obj $(BUILDDIR)buffer_put_escaped.obj $(BUILDDIR)buffer_read.obj $(BUILDDIR)buffer_read_fd.obj $(BUILDDIR)buffer_seek.obj $(BUILDDIR)buffer_skipc.obj $(BUILDDIR)buffer_skipn.obj $(BUILDDIR)buffer_skipspace.obj $(BUILDDIR)buffer_skip_pred.obj $(BUILDDIR)buffer_skip_until.obj $(BUILDDIR)buffer_stubborn.obj $(BUILDDIR)buffer_stubborn2.obj $(BUILDDIR)buffer_tosa.obj $(BUILDDIR)buffer_truncfile.obj $(BUILDDIR)buffer_write.obj $(BUILDDIR)buffer_write_fd.obj: \
	 $(BUILDDIR)%.obj: lib/buffer/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)byte_case_diff.obj $(BUILDDIR)byte_case_equal.obj $(BUILDDIR)byte_case_start.obj $(BUILDDIR)byte_chr.obj $(BUILDDIR)byte_copy.obj $(BUILDDIR)byte_copyr.obj $(BUILDDIR)byte_count.obj $(BUILDDIR)byte_diff.obj $(BUILDDIR)byte_equal.obj $(BUILDDIR)byte_fill.obj $(BUILDDIR)byte_fmt.obj $(BUILDDIR)byte_lower.obj $(BUILDDIR)byte_rchr.obj $(BUILDDIR)byte_scan.obj $(BUILDDIR)byte_upper.obj $(BUILDDIR)byte_zero.obj: \
	 $(BUILDDIR)%.obj: lib/byte/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)case_diffb.obj $(BUILDDIR)case_diffs.obj $(BUILDDIR)case_lowerb.obj $(BUILDDIR)case_lowers.obj $(BUILDDIR)case_starts.obj: \
	 $(BUILDDIR)%.obj: lib/case/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)cb_clear.obj $(BUILDDIR)cb_erase.obj $(BUILDDIR)cb_find.obj $(BUILDDIR)cb_find_prefix.obj $(BUILDDIR)cb_foreach.obj $(BUILDDIR)cb_get_kv.obj $(BUILDDIR)cb_get_kv_ex.obj $(BUILDDIR)cb_insert.obj $(BUILDDIR)cb_new_kv.obj: \
	 $(BUILDDIR)%.obj: lib/cb/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)alloc.obj $(BUILDDIR)cbmap_count.obj $(BUILDDIR)cbmap_data_node_destroy.obj $(BUILDDIR)cbmap_delete.obj $(BUILDDIR)cbmap_destroy.obj $(BUILDDIR)cbmap_get.obj $(BUILDDIR)cbmap_insert.obj $(BUILDDIR)cbmap_internal_node.obj $(BUILDDIR)cbmap_new.obj $(BUILDDIR)cbmap_visit.obj $(BUILDDIR)cbmap_visit_all.obj: \
	 $(BUILDDIR)%.obj: lib/cbmap/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)charbuf_close.obj $(BUILDDIR)charbuf_get.obj $(BUILDDIR)charbuf_getc.obj $(BUILDDIR)charbuf_init.obj $(BUILDDIR)charbuf_nextc.obj $(BUILDDIR)charbuf_peek.obj $(BUILDDIR)charbuf_peekc.obj $(BUILDDIR)charbuf_skip.obj $(BUILDDIR)charbuf_skip_pred.obj $(BUILDDIR)charbuf_skip_until.obj: \
	 $(BUILDDIR)%.obj: lib/charbuf/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)dir_close.obj $(BUILDDIR)dir_name.obj $(BUILDDIR)dir_open.obj $(BUILDDIR)dir_read.obj $(BUILDDIR)dir_time.obj $(BUILDDIR)dir_type.obj: \
	 $(BUILDDIR)%.obj: lib/dir/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)dns_dfd.obj $(BUILDDIR)dns_domain.obj $(BUILDDIR)dns_dtda.obj $(BUILDDIR)dns_ip4.obj $(BUILDDIR)dns_ip6.obj $(BUILDDIR)dns_ipq.obj $(BUILDDIR)dns_ipq6.obj $(BUILDDIR)dns_mx.obj $(BUILDDIR)dns_name.obj $(BUILDDIR)dns_nd.obj $(BUILDDIR)dns_nd6.obj $(BUILDDIR)dns_packet.obj $(BUILDDIR)dns_random.obj $(BUILDDIR)dns_rcip.obj $(BUILDDIR)dns_rcrw.obj $(BUILDDIR)dns_resolve.obj $(BUILDDIR)dns_sortip.obj $(BUILDDIR)dns_sortip6.obj $(BUILDDIR)dns_transmit.obj $(BUILDDIR)dns_txt.obj: \
	 $(BUILDDIR)%.obj: lib/dns/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)elf_dynamic_section.obj $(BUILDDIR)elf_get_section.obj $(BUILDDIR)elf_get_value.obj $(BUILDDIR)elf_header.obj $(BUILDDIR)elf_program_headers.obj $(BUILDDIR)elf_section_headers.obj $(BUILDDIR)elf_section_index.obj $(BUILDDIR)elf_section_offset.obj $(BUILDDIR)elf_section_size.obj $(BUILDDIR)elf_section_type.obj $(BUILDDIR)elf_shstrtab.obj: \
	 $(BUILDDIR)%.obj: lib/elf/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)env_addmodif.obj $(BUILDDIR)env_get.obj $(BUILDDIR)env_get2.obj $(BUILDDIR)env_len.obj $(BUILDDIR)env_make.obj $(BUILDDIR)env_merge.obj $(BUILDDIR)env_pick.obj $(BUILDDIR)env_put.obj $(BUILDDIR)env_set.obj $(BUILDDIR)env_string.obj $(BUILDDIR)env_unset.obj: \
	 $(BUILDDIR)%.obj: lib/env/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)errmsg_iam.obj $(BUILDDIR)errmsg_info.obj $(BUILDDIR)errmsg_infosys.obj $(BUILDDIR)errmsg_puts.obj $(BUILDDIR)errmsg_warn.obj $(BUILDDIR)errmsg_warnsys.obj $(BUILDDIR)errmsg_write.obj: \
	 $(BUILDDIR)%.obj: lib/errmsg/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)expand_arg.obj $(BUILDDIR)expand_args.obj $(BUILDDIR)expand_argv.obj $(BUILDDIR)expand_arith.obj $(BUILDDIR)expand_cat.obj $(BUILDDIR)expand_catsa.obj $(BUILDDIR)expand_command.obj $(BUILDDIR)expand_copysa.obj $(BUILDDIR)expand_escape.obj $(BUILDDIR)expand_glob.obj $(BUILDDIR)expand_param.obj $(BUILDDIR)expand_unescape.obj $(BUILDDIR)expand_vars.obj: \
	 $(BUILDDIR)%.obj: lib/expand/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)fmt_8long.obj $(BUILDDIR)fmt_octal.obj $(BUILDDIR)fmt_asn1derlength.obj $(BUILDDIR)fmt_asn1dertag.obj $(BUILDDIR)fmt_double.obj $(BUILDDIR)fmt_escapecharc.obj $(BUILDDIR)fmt_escapecharhtml.obj $(BUILDDIR)fmt_escapecharquotedprintable.obj $(BUILDDIR)fmt_escapecharquotedprintableutf8.obj $(BUILDDIR)fmt_escapecharshell.obj $(BUILDDIR)fmt_escapecharxml.obj $(BUILDDIR)fmt_fill.obj $(BUILDDIR)fmt_hexb.obj $(BUILDDIR)fmt_httpdate.obj $(BUILDDIR)fmt_human.obj $(BUILDDIR)fmt_humank.obj $(BUILDDIR)fmt_iso8601.obj $(BUILDDIR)fmt_long.obj $(BUILDDIR)fmt_longlong.obj $(BUILDDIR)fmt_minus.obj $(BUILDDIR)fmt_pad.obj $(BUILDDIR)fmt_plusminus.obj $(BUILDDIR)fmt_repeat.obj $(BUILDDIR)fmt_str.obj $(BUILDDIR)fmt_strm_internal.obj $(BUILDDIR)fmt_strn.obj $(BUILDDIR)fmt_tohex.obj $(BUILDDIR)fmt_ulonglong.obj $(BUILDDIR)fmt_ulong.obj $(BUILDDIR)fmt_ulong0.obj $(BUILDDIR)fmt_ulonglong.obj $(BUILDDIR)fmt_utf8.obj $(BUILDDIR)fmt_xlong.obj $(BUILDDIR)fmt_xlonglong.obj $(BUILDDIR)fmt_xmlescape.obj: \
	 $(BUILDDIR)%.obj: lib/fmt/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)gpio_init.obj $(BUILDDIR)gpio_read.obj $(BUILDDIR)gpio_set_input_pull.obj $(BUILDDIR)gpio_set_input_pull_down.obj $(BUILDDIR)gpio_set_input_pull_up.obj $(BUILDDIR)gpio_set_input_resistor_pull.obj $(BUILDDIR)gpio_set_output.obj $(BUILDDIR)gpio_set_pin_mode.obj $(BUILDDIR)gpio_short_wait.obj $(BUILDDIR)gpio_write.obj: \
	 $(BUILDDIR)%.obj: lib/gpio/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)hmap_add.obj $(BUILDDIR)hmap_add_tuple_with_data.obj $(BUILDDIR)hmap_delete.obj $(BUILDDIR)hmap_destroy.obj $(BUILDDIR)hmap_dump.obj $(BUILDDIR)hmap_free_data.obj $(BUILDDIR)hmap_init.obj $(BUILDDIR)hmap_internal.obj $(BUILDDIR)hmap_is_locate.obj $(BUILDDIR)hmap_print_list.obj $(BUILDDIR)hmap_print_table.obj $(BUILDDIR)hmap_print_tree.obj $(BUILDDIR)hmap_search.obj $(BUILDDIR)hmap_set.obj $(BUILDDIR)hmap_set_chars.obj $(BUILDDIR)hmap_set_stralloc.obj $(BUILDDIR)hmap_size.obj $(BUILDDIR)hmap_truncate.obj: \
	 $(BUILDDIR)%.obj: lib/hmap/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)http_get.obj $(BUILDDIR)http_init.obj $(BUILDDIR)http_readable.obj $(BUILDDIR)http_sendreq.obj $(BUILDDIR)http_socket.obj $(BUILDDIR)http_writeable.obj: \
	 $(BUILDDIR)%.obj: lib/http/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)iarray_allocate.obj $(BUILDDIR)iarray_free.obj $(BUILDDIR)iarray_get.obj $(BUILDDIR)iarray_init.obj $(BUILDDIR)iarray_length.obj: \
	 $(BUILDDIR)%.obj: lib/iarray/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)io_appendfile.obj $(BUILDDIR)io_block.obj $(BUILDDIR)io_canread.obj $(BUILDDIR)io_canwrite.obj $(BUILDDIR)io_check.obj $(BUILDDIR)io_close.obj $(BUILDDIR)io_closeonexec.obj $(BUILDDIR)io_createfile.obj $(BUILDDIR)io_debugstring.obj $(BUILDDIR)io_dontwantread.obj $(BUILDDIR)io_dontwantwrite.obj $(BUILDDIR)io_dup.obj $(BUILDDIR)io_eagain.obj $(BUILDDIR)io_eagain_read.obj $(BUILDDIR)io_eagain_write.obj $(BUILDDIR)io_fd.obj $(BUILDDIR)io_finishandshutdown.obj $(BUILDDIR)io_getcookie.obj $(BUILDDIR)io_mmapwritefile.obj $(BUILDDIR)io_nonblock.obj $(BUILDDIR)io_pipe.obj $(BUILDDIR)io_readfile.obj $(BUILDDIR)io_readwritefile.obj $(BUILDDIR)io_sendfile.obj $(BUILDDIR)io_setcookie.obj $(BUILDDIR)io_sigpipe.obj $(BUILDDIR)io_socketpair.obj $(BUILDDIR)io_timedout.obj $(BUILDDIR)io_timeout.obj $(BUILDDIR)io_timeouted.obj $(BUILDDIR)io_tryread.obj $(BUILDDIR)io_tryreadtimeout.obj $(BUILDDIR)io_trywrite.obj $(BUILDDIR)io_trywritetimeout.obj $(BUILDDIR)io_wait.obj $(BUILDDIR)io_waitread.obj $(BUILDDIR)io_waituntil.obj $(BUILDDIR)io_waituntil2.obj $(BUILDDIR)io_waitwrite.obj $(BUILDDIR)io_wantread.obj $(BUILDDIR)io_wantwrite.obj: \
	 $(BUILDDIR)%.obj: lib/io/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)json_free.obj $(BUILDDIR)json_newnode.obj $(BUILDDIR)json_parse.obj $(BUILDDIR)json_print.obj $(BUILDDIR)json_reader_init.obj $(BUILDDIR)json_read_callback.obj $(BUILDDIR)json_read_tree.obj: \
	 $(BUILDDIR)%.obj: lib/json/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)list_add_after.obj $(BUILDDIR)list_add_before.obj $(BUILDDIR)list_find.obj $(BUILDDIR)list_find_remove.obj $(BUILDDIR)list_init.obj $(BUILDDIR)list_length.obj $(BUILDDIR)list_move_head.obj $(BUILDDIR)list_move_tail.obj $(BUILDDIR)list_push.obj $(BUILDDIR)list_remove.obj $(BUILDDIR)list_swap.obj $(BUILDDIR)list_unshift.obj: \
	 $(BUILDDIR)%.obj: lib/list/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)map_deinit.obj $(BUILDDIR)map_get.obj $(BUILDDIR)map_getref.obj $(BUILDDIR)map_iter.obj $(BUILDDIR)map_next.obj $(BUILDDIR)map_remove.obj $(BUILDDIR)map_set.obj: \
	 $(BUILDDIR)%.obj: lib/map/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)mmap_map.obj $(BUILDDIR)mmap_private.obj $(BUILDDIR)mmap_private_fd.obj $(BUILDDIR)mmap_read.obj $(BUILDDIR)mmap_read_fd.obj $(BUILDDIR)mmap_rw_fd.obj $(BUILDDIR)mmap_shared.obj $(BUILDDIR)mmap_shared_fd.obj $(BUILDDIR)mmap_unmap.obj: \
	 $(BUILDDIR)%.obj: lib/mmap/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)ndelay_off.obj $(BUILDDIR)ndelay_on.obj: \
	 $(BUILDDIR)%.obj: lib/ndelay/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)openreadclose.obj $(BUILDDIR)open_append.obj $(BUILDDIR)open_excl.obj $(BUILDDIR)open_read.obj $(BUILDDIR)open_rw.obj $(BUILDDIR)open_trunc.obj $(BUILDDIR)open_write.obj $(BUILDDIR)readclose.obj: \
	 $(BUILDDIR)%.obj: lib/open/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)path_absolute.obj $(BUILDDIR)path_basename.obj $(BUILDDIR)path_canonicalize.obj $(BUILDDIR)path_dirname.obj $(BUILDDIR)path_exists.obj $(BUILDDIR)path_fnmatch.obj $(BUILDDIR)path_getcwd.obj $(BUILDDIR)path_gethome.obj $(BUILDDIR)path_len.obj $(BUILDDIR)path_len_s.obj $(BUILDDIR)path_num.obj $(BUILDDIR)path_num_sa.obj $(BUILDDIR)path_readlink.obj $(BUILDDIR)path_realpath.obj $(BUILDDIR)path_right.obj $(BUILDDIR)path_skip.obj $(BUILDDIR)path_skips.obj $(BUILDDIR)path_split.obj: \
	 $(BUILDDIR)%.obj: lib/path/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)pe_get_datadir.obj $(BUILDDIR)pe_get_section.obj $(BUILDDIR)pe_get_value.obj $(BUILDDIR)pe_header.obj $(BUILDDIR)pe_offset2rva.obj $(BUILDDIR)pe_rva2offset.obj $(BUILDDIR)pe_rva2ptr.obj $(BUILDDIR)pe_thunk.obj: \
	 $(BUILDDIR)%.obj: lib/pe/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)playlist_init.obj $(BUILDDIR)playlist_m3u.obj $(BUILDDIR)playlist_pls.obj $(BUILDDIR)playlist_read.obj $(BUILDDIR)playlist_write_entry.obj $(BUILDDIR)playlist_write_finish.obj $(BUILDDIR)playlist_write_start.obj $(BUILDDIR)playlist_xspf.obj: \
	 $(BUILDDIR)%.obj: lib/playlist/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)rdir_close.obj $(BUILDDIR)rdir_open.obj $(BUILDDIR)rdir_read.obj: \
	 $(BUILDDIR)%.obj: lib/rdir/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)scan_8int.obj $(BUILDDIR)scan_8long.obj $(BUILDDIR)scan_octal.obj $(BUILDDIR)scan_8longn.obj $(BUILDDIR)scan_8short.obj $(BUILDDIR)scan_asn1derlength.obj $(BUILDDIR)scan_asn1dertag.obj $(BUILDDIR)scan_charsetnskip.obj $(BUILDDIR)scan_double.obj $(BUILDDIR)scan_fromhex.obj $(BUILDDIR)scan_httpdate.obj $(BUILDDIR)scan_int.obj $(BUILDDIR)scan_long.obj $(BUILDDIR)scan_longlong.obj $(BUILDDIR)scan_longn.obj $(BUILDDIR)scan_netstring.obj $(BUILDDIR)scan_noncharsetnskip.obj $(BUILDDIR)scan_nonwhitenskip.obj $(BUILDDIR)scan_pb_tag.obj $(BUILDDIR)scan_pb_type0_sint.obj $(BUILDDIR)scan_pb_type1_fixed64.obj $(BUILDDIR)scan_pb_type5_fixed32.obj $(BUILDDIR)scan_plusminus.obj $(BUILDDIR)scan_short.obj $(BUILDDIR)scan_uint.obj $(BUILDDIR)scan_ulong.obj $(BUILDDIR)scan_ulonglong.obj $(BUILDDIR)scan_ulongn.obj $(BUILDDIR)scan_ushort.obj $(BUILDDIR)scan_utf8.obj $(BUILDDIR)scan_varint.obj $(BUILDDIR)scan_whitenskip.obj $(BUILDDIR)scan_xint.obj $(BUILDDIR)scan_xlong.obj $(BUILDDIR)scan_xlonglong.obj $(BUILDDIR)scan_xlongn.obj $(BUILDDIR)scan_xmlescape.obj $(BUILDDIR)scan_xshort.obj: \
	 $(BUILDDIR)%.obj: lib/scan/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)sig_block.obj $(BUILDDIR)sig_unblock.obj: \
	 $(BUILDDIR)%.obj: lib/sig/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)slist_add_after.obj $(BUILDDIR)slist_add_before.obj $(BUILDDIR)slist_find.obj $(BUILDDIR)slist_find_remove.obj $(BUILDDIR)slist_init.obj $(BUILDDIR)slist_length.obj $(BUILDDIR)slist_move_head.obj $(BUILDDIR)slist_move_tail.obj $(BUILDDIR)slist_push.obj $(BUILDDIR)slist_pushs.obj $(BUILDDIR)slist_remove.obj $(BUILDDIR)slist_unshift.obj: \
	 $(BUILDDIR)%.obj: lib/slist/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)fmt_ip4.obj $(BUILDDIR)fmt_ip6.obj $(BUILDDIR)fmt_ip6c.obj $(BUILDDIR)fmt_ip6if.obj $(BUILDDIR)fmt_ip6ifc.obj $(BUILDDIR)fmt_ip6_flat.obj $(BUILDDIR)init.obj $(BUILDDIR)scan_ip4.obj $(BUILDDIR)scan_ip6.obj $(BUILDDIR)scan_ip6if.obj $(BUILDDIR)scan_ip6_flat.obj $(BUILDDIR)socket_accept4.obj $(BUILDDIR)socket_accept6.obj $(BUILDDIR)socket_bind4.obj $(BUILDDIR)socket_bind4_reuse.obj $(BUILDDIR)socket_bind6.obj $(BUILDDIR)socket_bind6_reuse.obj $(BUILDDIR)socket_broadcast.obj $(BUILDDIR)socket_connect4.obj $(BUILDDIR)socket_connect6.obj $(BUILDDIR)socket_connected.obj $(BUILDDIR)socket_deferaccept.obj $(BUILDDIR)socket_fastopen.obj $(BUILDDIR)socket_fastopen_connect4.obj $(BUILDDIR)socket_fastopen_connect6.obj $(BUILDDIR)socket_getifidx.obj $(BUILDDIR)socket_getifname.obj $(BUILDDIR)socket_ip4loopback.obj $(BUILDDIR)socket_listen.obj $(BUILDDIR)socket_local4.obj $(BUILDDIR)socket_local6.obj $(BUILDDIR)socket_mchopcount6.obj $(BUILDDIR)socket_mcjoin4.obj $(BUILDDIR)socket_mcjoin6.obj $(BUILDDIR)socket_mcleave4.obj $(BUILDDIR)socket_mcleave6.obj $(BUILDDIR)socket_mcloop4.obj $(BUILDDIR)socket_mcloop6.obj $(BUILDDIR)socket_mcttl4.obj $(BUILDDIR)socket_noipv6.obj $(BUILDDIR)socket_quickack.obj $(BUILDDIR)socket_recv4.obj $(BUILDDIR)socket_recv6.obj $(BUILDDIR)socket_remote4.obj $(BUILDDIR)socket_remote6.obj $(BUILDDIR)socket_sctp4.obj $(BUILDDIR)socket_sctp4b.obj $(BUILDDIR)socket_sctp6.obj $(BUILDDIR)socket_sctp6b.obj $(BUILDDIR)socket_send4.obj $(BUILDDIR)socket_send6.obj $(BUILDDIR)socket_tcp4.obj $(BUILDDIR)socket_tcp4b.obj $(BUILDDIR)socket_tcp6.obj $(BUILDDIR)socket_tcp6b.obj $(BUILDDIR)socket_tryreservein.obj $(BUILDDIR)socket_udp4.obj $(BUILDDIR)socket_udp6.obj $(BUILDDIR)socket_v4mappedprefix.obj $(BUILDDIR)socket_v6any.obj $(BUILDDIR)socket_v6loopback.obj $(BUILDDIR)winsock2errno.obj $(BUILDDIR)winsock_init.obj $(BUILDDIR)winsock_socketpair.obj: \
	 $(BUILDDIR)%.obj: lib/socket/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)str_basename.obj $(BUILDDIR)str_case_diff.obj $(BUILDDIR)str_case_diffn.obj $(BUILDDIR)str_case_equal.obj $(BUILDDIR)str_case_start.obj $(BUILDDIR)str_cat.obj $(BUILDDIR)str_chr.obj $(BUILDDIR)str_copy.obj $(BUILDDIR)str_copyb.obj $(BUILDDIR)str_copyn.obj $(BUILDDIR)str_decamelize.obj $(BUILDDIR)str_diff.obj $(BUILDDIR)str_diffn.obj $(BUILDDIR)str_dup.obj $(BUILDDIR)str_equal.obj $(BUILDDIR)str_find.obj $(BUILDDIR)str_findb.obj $(BUILDDIR)str_istr.obj $(BUILDDIR)str_len.obj $(BUILDDIR)str_lower.obj $(BUILDDIR)str_ndup.obj $(BUILDDIR)str_ptime.obj $(BUILDDIR)str_rchr.obj $(BUILDDIR)str_rchrs.obj $(BUILDDIR)str_start.obj $(BUILDDIR)str_tok.obj: \
	 $(BUILDDIR)%.obj: lib/str/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)mmap_filename.obj $(BUILDDIR)stralloc_0.obj $(BUILDDIR)stralloc_append.objbj $(BUILDDIR)stralloc_case_diff.obj $(BUILDDIR)stralloc_case_diffs.obj $(BUILDDIR)stralloc_case_end.obj $(BUILDDIR)stralloc_case_equal.obj $(BUILDDIR)stralloc_case_equals.obj $(BUILDDIR)stralloc_case_start.obj $(BUILDDIR)stralloc_case_starts.obj $(BUILDDIR)stralloc_cat.obj $(BUILDDIR)stralloc_catb.obj $(BUILDDIR)stralloc_catc.obj $(BUILDDIR)stralloc_catdouble.obj $(BUILDDIR)stralloc_cathexb.obj $(BUILDDIR)stralloc_catint.obj $(BUILDDIR)stralloc_catint0.obj $(BUILDDIR)stralloc_catlong.obj $(BUILDDIR)stralloc_catlong0.obj $(BUILDDIR)stralloc_catm_internal.obj $(BUILDDIR)stralloc_cats.obj $(BUILDDIR)stralloc_catuint.obj $(BUILDDIR)stralloc_catuint0.obj $(BUILDDIR)stralloc_catulong.obj $(BUILDDIR)stralloc_catulong0.obj $(BUILDDIR)stralloc_catxlong.obj $(BUILDDIR)stralloc_chomp.obj $(BUILDDIR)stralloc_chop.obj $(BUILDDIR)stralloc_chr.obj $(BUILDDIR)stralloc_copy.obj $(BUILDDIR)stralloc_copyb.obj $(BUILDDIR)stralloc_copys.obj $(BUILDDIR)stralloc_copywcb.obj $(BUILDDIR)stralloc_copywcs.obj $(BUILDDIR)stralloc_count.obj $(BUILDDIR)stralloc_decamelize.obj $(BUILDDIR)stralloc_diff.obj $(BUILDDIR)stralloc_diffb.obj $(BUILDDIR)stralloc_diffs.obj $(BUILDDIR)stralloc_endb.obj $(BUILDDIR)stralloc_ends.obj $(BUILDDIR)stralloc_equal.obj $(BUILDDIR)stralloc_equalb.obj $(BUILDDIR)stralloc_equals.obj $(BUILDDIR)stralloc_erase.obj $(BUILDDIR)stralloc_expand.obj $(BUILDDIR)stralloc_find.obj $(BUILDDIR)stralloc_findb.obj $(BUILDDIR)stralloc_finds.obj $(BUILDDIR)stralloc_fmt.obj $(BUILDDIR)stralloc_fmt_call.obj $(BUILDDIR)stralloc_fmt_pred.obj $(BUILDDIR)stralloc_free.obj $(BUILDDIR)stralloc_init.obj $(BUILDDIR)stralloc_insert.obj $(BUILDDIR)stralloc_insertb.obj $(BUILDDIR)stralloc_inserts.obj $(BUILDDIR)stralloc_lower.obj $(BUILDDIR)stralloc_move.obj $(BUILDDIR)stralloc_nul.obj $(BUILDDIR)stralloc_prepend.obj $(BUILDDIR)stralloc_prependb.obj $(BUILDDIR)stralloc_prepends.obj $(BUILDDIR)stralloc_rchr.obj $(BUILDDIR)stralloc_ready.obj $(BUILDDIR)stralloc_readyplus.obj $(BUILDDIR)stralloc_ready_tuned.obj $(BUILDDIR)stralloc_remove.obj $(BUILDDIR)stralloc_remove_all.obj $(BUILDDIR)stralloc_replace.obj $(BUILDDIR)stralloc_replace_non_printable.obj $(BUILDDIR)stralloc_reverse.obj $(BUILDDIR)stralloc_reverse_blocks.obj $(BUILDDIR)stralloc_scan.obj $(BUILDDIR)stralloc_shrink.obj $(BUILDDIR)stralloc_start.obj $(BUILDDIR)stralloc_startb.obj $(BUILDDIR)stralloc_starts.obj $(BUILDDIR)stralloc_subst.obj $(BUILDDIR)stralloc_trim.obj $(BUILDDIR)stralloc_trunc.obj $(BUILDDIR)stralloc_upper.obj $(BUILDDIR)stralloc_write.obj $(BUILDDIR)stralloc_zero.obj: \
	 $(BUILDDIR)%.obj: lib/stralloc/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)strarray_appends.obj $(BUILDDIR)strarray_from_argv.obj $(BUILDDIR)strarray_index_of.obj $(BUILDDIR)strarray_joins.obj $(BUILDDIR)strarray_pop.obj $(BUILDDIR)strarray_prepends.obj $(BUILDDIR)strarray_push.obj $(BUILDDIR)strarray_pushb.obj $(BUILDDIR)strarray_pushd.obj $(BUILDDIR)strarray_push_sa.obj $(BUILDDIR)strarray_removeprefixs.obj $(BUILDDIR)strarray_removesuffixs.obj $(BUILDDIR)strarray_set.obj $(BUILDDIR)strarray_sort.obj $(BUILDDIR)strarray_to_argv.obj: \
	 $(BUILDDIR)%.obj: lib/strarray/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)strlist_append_sa.obj $(BUILDDIR)strlist_at.obj $(BUILDDIR)strlist_at_n.obj $(BUILDDIR)strlist_at_sa.obj $(BUILDDIR)strlist_cat.obj $(BUILDDIR)strlist_contains.obj $(BUILDDIR)strlist_contains_sa.obj $(BUILDDIR)strlist_count.obj $(BUILDDIR)strlist_dump.obj $(BUILDDIR)strlist_froms.obj $(BUILDDIR)strlist_index_of.obj $(BUILDDIR)strlist_join.obj $(BUILDDIR)strlist_joins.obj $(BUILDDIR)strlist_prependb.obj $(BUILDDIR)strlist_prepends.obj $(BUILDDIR)strlist_prepend_sa.obj $(BUILDDIR)strlist_push.obj $(BUILDDIR)strlist_pushb.obj $(BUILDDIR)strlist_pushm_internal.obj $(BUILDDIR)strlist_push_sa.obj $(BUILDDIR)strlist_push_tokens.obj $(BUILDDIR)strlist_push_unique.obj $(BUILDDIR)strlist_push_unique_sa.obj $(BUILDDIR)strlist_range.obj $(BUILDDIR)strlist_shift.obj $(BUILDDIR)strlist_shift_n.obj $(BUILDDIR)strlist_sort.obj $(BUILDDIR)strlist_to_argv.obj $(BUILDDIR)strlist_unshift.obj: \
	 $(BUILDDIR)%.obj: lib/strlist/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)tai_add.obj $(BUILDDIR)tai_now.obj $(BUILDDIR)tai_pack.obj $(BUILDDIR)tai_sub.obj $(BUILDDIR)tai_uint.obj $(BUILDDIR)tai_unpack.obj: \
	 $(BUILDDIR)%.obj: lib/tai/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)taia_add.obj $(BUILDDIR)taia_addsec.obj $(BUILDDIR)taia_approx.obj $(BUILDDIR)taia_frac.obj $(BUILDDIR)taia_half.obj $(BUILDDIR)taia_less.obj $(BUILDDIR)taia_now.obj $(BUILDDIR)taia_pack.obj $(BUILDDIR)taia_sub.obj $(BUILDDIR)taia_tai.obj $(BUILDDIR)taia_uint.obj $(BUILDDIR)taia_unpack.obj: \
	 $(BUILDDIR)%.obj: lib/taia/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)is_textbuf.obj $(BUILDDIR)textbuf_column.obj $(BUILDDIR)textbuf_free.obj $(BUILDDIR)textbuf_init.obj $(BUILDDIR)textbuf_line.obj $(BUILDDIR)textbuf_read.obj: \
	 $(BUILDDIR)%.obj: lib/textbuf/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)uint16_pack.obj $(BUILDDIR)uint16_pack_big.obj $(BUILDDIR)uint16_read.obj $(BUILDDIR)uint16_read_big.obj $(BUILDDIR)uint16_unpack.obj $(BUILDDIR)uint16_unpack_big.obj: \
	 $(BUILDDIR)%.obj: lib/uint16/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)uint32_pack.obj $(BUILDDIR)uint32_pack_big.obj $(BUILDDIR)uint32_read.obj $(BUILDDIR)uint32_read_big.obj $(BUILDDIR)uint32_unpack.obj $(BUILDDIR)uint32_unpack_big.obj: \
	 $(BUILDDIR)%.obj: lib/uint32/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)uint64_pack.obj $(BUILDDIR)uint64_pack_big.obj $(BUILDDIR)uint64_read.obj $(BUILDDIR)uint64_read_big.obj $(BUILDDIR)uint64_unpack.obj $(BUILDDIR)uint64_unpack_big.obj: \
	 $(BUILDDIR)%.obj: lib/uint64/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)var_bsearch.obj $(BUILDDIR)var_chflg.obj $(BUILDDIR)var_cleanup.obj $(BUILDDIR)var_copys.obj $(BUILDDIR)var_count.obj $(BUILDDIR)var_create.obj $(BUILDDIR)var_dump.obj $(BUILDDIR)var_export.obj $(BUILDDIR)var_get.obj $(BUILDDIR)var_hsearch.obj $(BUILDDIR)var_import.obj $(BUILDDIR)var_init.obj $(BUILDDIR)var_len.obj $(BUILDDIR)var_lexhash.obj $(BUILDDIR)var_print.obj $(BUILDDIR)var_rndhash.obj $(BUILDDIR)var_search.obj $(BUILDDIR)var_set.obj $(BUILDDIR)var_setsa.obj $(BUILDDIR)var_setvint.obj $(BUILDDIR)var_setvsa.obj $(BUILDDIR)var_unset.obj $(BUILDDIR)var_valid.obj $(BUILDDIR)var_value.obj $(BUILDDIR)var_vdefault.obj $(BUILDDIR)var_vlen.obj: \
	 $(BUILDDIR)%.obj: lib/var/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)vartab_add.obj $(BUILDDIR)vartab_cleanup.obj $(BUILDDIR)vartab_dump.obj $(BUILDDIR)vartab_hash.obj $(BUILDDIR)vartab_pop.obj $(BUILDDIR)vartab_print.obj $(BUILDDIR)vartab_push.obj $(BUILDDIR)vartab_root.obj $(BUILDDIR)vartab_search.obj: \
	 $(BUILDDIR)%.obj: lib/vartab/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)waitn.obj $(BUILDDIR)waitn_reap.obj $(BUILDDIR)waitpid_nointr.obj $(BUILDDIR)wait_nointr.obj $(BUILDDIR)wait_pids_nohang.obj $(BUILDDIR)wait_pid_nohang.obj $(BUILDDIR)wait_reap.obj: \
	 $(BUILDDIR)%.obj: lib/wait/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)xml_add_child.obj $(BUILDDIR)xml_attrnode.obj $(BUILDDIR)xml_content.obj $(BUILDDIR)xml_content_sa.obj $(BUILDDIR)xml_debug.obj $(BUILDDIR)xml_delete.obj $(BUILDDIR)xml_element.obj $(BUILDDIR)xml_escape.obj $(BUILDDIR)xml_find_all_pred.obj $(BUILDDIR)xml_find_element.obj $(BUILDDIR)xml_find_element_attr.obj $(BUILDDIR)xml_find_parent.obj $(BUILDDIR)xml_find_pred.obj $(BUILDDIR)xml_find_predicates.obj $(BUILDDIR)xml_free.obj $(BUILDDIR)xml_get_attribute.obj $(BUILDDIR)xml_get_attribute_double.obj $(BUILDDIR)xml_get_attribute_sa.obj $(BUILDDIR)xml_get_document.obj $(BUILDDIR)xml_has_attribute.obj $(BUILDDIR)xml_insert.obj $(BUILDDIR)xml_newnode.obj $(BUILDDIR)xml_path.obj $(BUILDDIR)xml_print.obj $(BUILDDIR)xml_print_attributes.obj $(BUILDDIR)xml_print_nodeset.obj $(BUILDDIR)xml_reader_init.obj $(BUILDDIR)xml_read_callback.obj $(BUILDDIR)xml_read_tree.obj $(BUILDDIR)xml_remove.obj $(BUILDDIR)xml_root_element.obj $(BUILDDIR)xml_set_attribute.obj $(BUILDDIR)xml_set_attribute_double.obj $(BUILDDIR)xml_textnode.obj: \
	 $(BUILDDIR)%.obj: lib/xml/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(CPPFLAGS) -c -n"$(BUILDDIR)" $^

$(BUILDDIR)array.a: $(BUILDDIR)array_allocate.obj $(BUILDDIR)array_bytes.obj $(BUILDDIR)array_cat.obj $(BUILDDIR)array_cat0.obj $(BUILDDIR)array_catb.obj $(BUILDDIR)array_cate.obj $(BUILDDIR)array_cats.obj $(BUILDDIR)array_cats0.obj $(BUILDDIR)array_end.obj $(BUILDDIR)array_equal.obj $(BUILDDIR)array_fail.obj $(BUILDDIR)array_get.obj $(BUILDDIR)array_length.obj $(BUILDDIR)array_reset.obj $(BUILDDIR)array_start.obj $(BUILDDIR)array_trunc.obj $(BUILDDIR)array_truncate.obj $(BUILDDIR)umult64.obj

$(BUILDDIR)binfmt.a: $(BUILDDIR)binfmt_open.obj

$(BUILDDIR)buffer.a: $(BUILDDIR)buffer_0.obj $(BUILDDIR)buffer_0small.obj $(BUILDDIR)buffer_1.obj $(BUILDDIR)buffer_1small.obj $(BUILDDIR)buffer_2.obj $(BUILDDIR)buffer_bz2.obj $(BUILDDIR)buffer_bzip.obj $(BUILDDIR)buffer_close.obj $(BUILDDIR)buffer_copy.obj $(BUILDDIR)buffer_default.obj $(BUILDDIR)buffer_deflate.obj $(BUILDDIR)buffer_dummyread.obj $(BUILDDIR)buffer_dummyreadmmap.obj $(BUILDDIR)buffer_dump.obj $(BUILDDIR)buffer_feed.obj $(BUILDDIR)buffer_flush.obj $(BUILDDIR)buffer_free.obj $(BUILDDIR)buffer_freshen.obj $(BUILDDIR)buffer_fromarray.obj $(BUILDDIR)buffer_frombuf.obj $(BUILDDIR)buffer_fromsa.obj $(BUILDDIR)buffer_fromstr.obj $(BUILDDIR)buffer_get.obj $(BUILDDIR)buffer_get_new_token_sa.obj $(BUILDDIR)buffer_get_new_token_sa_pred.obj $(BUILDDIR)buffer_get_token.obj $(BUILDDIR)buffer_get_token_pred.obj $(BUILDDIR)buffer_get_token_sa.obj $(BUILDDIR)buffer_get_token_sa_pred.obj $(BUILDDIR)buffer_get_until.obj $(BUILDDIR)buffer_getc.obj $(BUILDDIR)buffer_getline.obj $(BUILDDIR)buffer_getline_sa.obj $(BUILDDIR)buffer_getn.obj $(BUILDDIR)buffer_getnewline_sa.obj $(BUILDDIR)buffer_gettok_sa.obj $(BUILDDIR)buffer_gzip.obj $(BUILDDIR)buffer_inflate.obj $(BUILDDIR)buffer_init.obj $(BUILDDIR)buffer_init_free.obj $(BUILDDIR)buffer_lzma.obj $(BUILDDIR)buffer_mmap.obj $(BUILDDIR)buffer_mmapprivate.obj $(BUILDDIR)buffer_mmapprivate_fd.obj $(BUILDDIR)buffer_mmapread.obj $(BUILDDIR)buffer_mmapread_fd.obj $(BUILDDIR)buffer_mmapshared_fd.obj $(BUILDDIR)buffer_munmap.obj $(BUILDDIR)buffer_peek.obj $(BUILDDIR)buffer_peekc.obj $(BUILDDIR)buffer_prefetch.obj $(BUILDDIR)buffer_put.obj $(BUILDDIR)buffer_put8long.obj $(BUILDDIR)buffer_put_escaped.obj $(BUILDDIR)buffer_putalign.obj $(BUILDDIR)buffer_putc.obj $(BUILDDIR)buffer_putdouble.obj $(BUILDDIR)buffer_puterror.obj $(BUILDDIR)buffer_puterror2.obj $(BUILDDIR)buffer_putflush.obj $(BUILDDIR)buffer_putlonglong.obj $(BUILDDIR)buffer_putlong.obj $(BUILDDIR)buffer_putlonglong.obj $(BUILDDIR)buffer_putm_internal.obj $(BUILDDIR)buffer_putm_internal_flush.obj $(BUILDDIR)buffer_putnc.obj $(BUILDDIR)buffer_putnlflush.obj $(BUILDDIR)buffer_putnspace.obj $(BUILDDIR)buffer_putptr.obj $(BUILDDIR)buffer_puts.obj $(BUILDDIR)buffer_puts_escaped.obj $(BUILDDIR)buffer_putsa.obj $(BUILDDIR)buffer_putsaflush.obj $(BUILDDIR)buffer_putsalign.obj $(BUILDDIR)buffer_putsflush.obj $(BUILDDIR)buffer_putspace.obj $(BUILDDIR)buffer_putspad.obj $(BUILDDIR)buffer_putulonglong.obj $(BUILDDIR)buffer_putulong.obj $(BUILDDIR)buffer_putulong0.obj $(BUILDDIR)buffer_putulonglong.obj $(BUILDDIR)buffer_putxlong.obj $(BUILDDIR)buffer_putxlong0.obj $(BUILDDIR)buffer_putxlonglong.obj $(BUILDDIR)buffer_putxlonglong0.obj $(BUILDDIR)buffer_read.obj $(BUILDDIR)buffer_read_fd.obj $(BUILDDIR)buffer_seek.obj $(BUILDDIR)buffer_skip_pred.obj $(BUILDDIR)buffer_skip_until.obj $(BUILDDIR)buffer_skipc.obj $(BUILDDIR)buffer_skipn.obj $(BUILDDIR)buffer_skipspace.obj $(BUILDDIR)buffer_stubborn.obj $(BUILDDIR)buffer_stubborn2.obj $(BUILDDIR)buffer_tosa.obj $(BUILDDIR)buffer_truncfile.obj $(BUILDDIR)buffer_write.obj $(BUILDDIR)buffer_write_fd.obj

$(BUILDDIR)byte.a: $(BUILDDIR)byte_case_diff.obj $(BUILDDIR)byte_case_equal.obj $(BUILDDIR)byte_case_start.obj $(BUILDDIR)byte_chr.obj $(BUILDDIR)byte_copy.obj $(BUILDDIR)byte_copyr.obj $(BUILDDIR)byte_count.obj $(BUILDDIR)byte_diff.obj $(BUILDDIR)byte_equal.obj $(BUILDDIR)byte_fill.obj $(BUILDDIR)byte_fmt.obj $(BUILDDIR)byte_lower.obj $(BUILDDIR)byte_rchr.obj $(BUILDDIR)byte_scan.obj $(BUILDDIR)byte_upper.obj $(BUILDDIR)byte_zero.obj

$(BUILDDIR)case.a: $(BUILDDIR)case_diffb.obj $(BUILDDIR)case_diffs.obj $(BUILDDIR)case_lowerb.obj $(BUILDDIR)case_lowers.obj $(BUILDDIR)case_starts.obj

$(BUILDDIR)cb.a: $(BUILDDIR)cb_clear.obj $(BUILDDIR)cb_erase.obj $(BUILDDIR)cb_find.obj $(BUILDDIR)cb_find_prefix.obj $(BUILDDIR)cb_foreach.obj $(BUILDDIR)cb_get_kv.obj $(BUILDDIR)cb_get_kv_ex.obj $(BUILDDIR)cb_insert.obj $(BUILDDIR)cb_new_kv.obj

$(BUILDDIR)cbmap.a: $(BUILDDIR)alloc.obj $(BUILDDIR)cbmap_count.obj $(BUILDDIR)cbmap_data_node_destroy.obj $(BUILDDIR)cbmap_delete.obj $(BUILDDIR)cbmap_destroy.obj $(BUILDDIR)cbmap_get.obj $(BUILDDIR)cbmap_insert.obj $(BUILDDIR)cbmap_internal_node.obj $(BUILDDIR)cbmap_new.obj $(BUILDDIR)cbmap_visit.obj $(BUILDDIR)cbmap_visit_all.obj $(BUILDDIR)memalign.obj

$(BUILDDIR)charbuf.a: $(BUILDDIR)charbuf_close.obj $(BUILDDIR)charbuf_get.obj $(BUILDDIR)charbuf_getc.obj $(BUILDDIR)charbuf_init.obj $(BUILDDIR)charbuf_nextc.obj $(BUILDDIR)charbuf_peek.obj $(BUILDDIR)charbuf_peekc.obj $(BUILDDIR)charbuf_skip.obj $(BUILDDIR)charbuf_skip_pred.obj $(BUILDDIR)charbuf_skip_until.obj

$(BUILDDIR)dir.a: $(BUILDDIR)dir_close.obj $(BUILDDIR)dir_name.obj $(BUILDDIR)dir_open.obj $(BUILDDIR)dir_read.obj $(BUILDDIR)dir_time.obj $(BUILDDIR)dir_type.obj $(BUILDDIR)utf8.obj

$(BUILDDIR)dns.a: $(BUILDDIR)dns_dfd.obj $(BUILDDIR)dns_domain.obj $(BUILDDIR)dns_dtda.obj $(BUILDDIR)dns_ip4.obj $(BUILDDIR)dns_ip6.obj $(BUILDDIR)dns_ipq.obj $(BUILDDIR)dns_ipq6.obj $(BUILDDIR)dns_mx.obj $(BUILDDIR)dns_name.obj $(BUILDDIR)dns_nd.obj $(BUILDDIR)dns_nd6.obj $(BUILDDIR)dns_packet.obj $(BUILDDIR)dns_random.obj $(BUILDDIR)dns_rcip.obj $(BUILDDIR)dns_rcrw.obj $(BUILDDIR)dns_resolve.obj $(BUILDDIR)dns_sortip.obj $(BUILDDIR)dns_sortip6.obj $(BUILDDIR)dns_transmit.obj $(BUILDDIR)dns_txt.obj $(BUILDDIR)init.obj

$(BUILDDIR)elf.a: $(BUILDDIR)elf_dynamic_section.obj $(BUILDDIR)elf_get_section.obj $(BUILDDIR)elf_get_value.obj $(BUILDDIR)elf_header.obj $(BUILDDIR)elf_program_headers.obj $(BUILDDIR)elf_section_headers.obj $(BUILDDIR)elf_section_index.obj $(BUILDDIR)elf_section_offset.obj $(BUILDDIR)elf_section_size.obj $(BUILDDIR)elf_section_type.obj $(BUILDDIR)elf_shstrtab.obj

$(BUILDDIR)env.a: $(BUILDDIR)env_addmodif.obj $(BUILDDIR)env_get.obj $(BUILDDIR)env_get2.obj $(BUILDDIR)env_len.obj $(BUILDDIR)env_make.obj $(BUILDDIR)env_merge.obj $(BUILDDIR)env_pick.obj $(BUILDDIR)env_put.obj $(BUILDDIR)env_set.obj $(BUILDDIR)env_string.obj $(BUILDDIR)env_unset.obj $(BUILDDIR)getenv.obj $(BUILDDIR)setenv.obj

$(BUILDDIR)errmsg.a: $(BUILDDIR)errmsg_iam.obj $(BUILDDIR)errmsg_info.obj $(BUILDDIR)errmsg_infosys.obj $(BUILDDIR)errmsg_puts.obj $(BUILDDIR)errmsg_warn.obj $(BUILDDIR)errmsg_warnsys.obj $(BUILDDIR)errmsg_write.obj

$(BUILDDIR)expand.a: $(BUILDDIR)expand_arg.obj $(BUILDDIR)expand_args.obj $(BUILDDIR)expand_argv.obj $(BUILDDIR)expand_arith.obj $(BUILDDIR)expand_cat.obj $(BUILDDIR)expand_catsa.obj $(BUILDDIR)expand_command.obj $(BUILDDIR)expand_copysa.obj $(BUILDDIR)expand_escape.obj $(BUILDDIR)expand_glob.obj $(BUILDDIR)expand_param.obj $(BUILDDIR)expand_unescape.obj $(BUILDDIR)expand_vars.obj $(BUILDDIR)glob.obj

$(BUILDDIR)fmt.a: $(BUILDDIR)fmt_8long.obj $(BUILDDIR)fmt_octal.obj $(BUILDDIR)fmt_asn1derlength.obj $(BUILDDIR)fmt_asn1dertag.obj $(BUILDDIR)fmt_double.obj $(BUILDDIR)fmt_escapecharc.obj $(BUILDDIR)fmt_escapecharhtml.obj $(BUILDDIR)fmt_escapecharquotedprintable.obj $(BUILDDIR)fmt_escapecharquotedprintableutf8.obj $(BUILDDIR)fmt_escapecharshell.obj $(BUILDDIR)fmt_escapecharxml.obj $(BUILDDIR)fmt_fill.obj $(BUILDDIR)fmt_hexb.obj $(BUILDDIR)fmt_httpdate.obj $(BUILDDIR)fmt_human.obj $(BUILDDIR)fmt_humank.obj $(BUILDDIR)fmt_iso8601.obj $(BUILDDIR)fmt_long.obj $(BUILDDIR)fmt_longlong.obj $(BUILDDIR)fmt_minus.obj $(BUILDDIR)fmt_pad.obj $(BUILDDIR)fmt_plusminus.obj $(BUILDDIR)fmt_repeat.obj $(BUILDDIR)fmt_str.obj $(BUILDDIR)fmt_strm_internal.obj $(BUILDDIR)fmt_strn.obj $(BUILDDIR)fmt_tohex.obj $(BUILDDIR)fmt_ulonglong.obj $(BUILDDIR)fmt_ulong.obj $(BUILDDIR)fmt_ulong0.obj $(BUILDDIR)fmt_ulonglong.obj $(BUILDDIR)fmt_utf8.obj $(BUILDDIR)fmt_xlong.obj $(BUILDDIR)fmt_xlonglong.obj $(BUILDDIR)fmt_xmlescape.obj

$(BUILDDIR)gpio.a: $(BUILDDIR)gpio_init.obj $(BUILDDIR)gpio_read.obj $(BUILDDIR)gpio_set_input_pull.obj $(BUILDDIR)gpio_set_input_pull_down.obj $(BUILDDIR)gpio_set_input_pull_up.obj $(BUILDDIR)gpio_set_input_resistor_pull.obj $(BUILDDIR)gpio_set_output.obj $(BUILDDIR)gpio_set_pin_mode.obj $(BUILDDIR)gpio_short_wait.obj $(BUILDDIR)gpio_write.obj

$(BUILDDIR)hmap.a: $(BUILDDIR)hmap_add.obj $(BUILDDIR)hmap_add_tuple_with_data.obj $(BUILDDIR)hmap_delete.obj $(BUILDDIR)hmap_destroy.obj $(BUILDDIR)hmap_dump.obj $(BUILDDIR)hmap_free_data.obj $(BUILDDIR)hmap_init.obj $(BUILDDIR)hmap_internal.obj $(BUILDDIR)hmap_is_locate.obj $(BUILDDIR)hmap_print_list.obj $(BUILDDIR)hmap_print_table.obj $(BUILDDIR)hmap_print_tree.obj $(BUILDDIR)hmap_search.obj $(BUILDDIR)hmap_set.obj $(BUILDDIR)hmap_set_chars.obj $(BUILDDIR)hmap_set_stralloc.obj $(BUILDDIR)hmap_size.obj $(BUILDDIR)hmap_truncate.obj

$(BUILDDIR)http.a: $(BUILDDIR)http_get.obj $(BUILDDIR)http_init.obj $(BUILDDIR)http_readable.obj $(BUILDDIR)http_sendreq.obj $(BUILDDIR)http_socket.obj $(BUILDDIR)http_writeable.obj

$(BUILDDIR)iarray.a: $(BUILDDIR)iarray_allocate.obj $(BUILDDIR)iarray_free.obj $(BUILDDIR)iarray_get.obj $(BUILDDIR)iarray_init.obj $(BUILDDIR)iarray_length.obj

$(BUILDDIR)io.a: $(BUILDDIR)io_appendfile.obj $(BUILDDIR)io_block.obj $(BUILDDIR)io_canread.obj $(BUILDDIR)io_canwrite.obj $(BUILDDIR)io_check.obj $(BUILDDIR)io_close.obj $(BUILDDIR)io_closeonexec.obj $(BUILDDIR)io_createfile.obj $(BUILDDIR)io_debugstring.obj $(BUILDDIR)io_dontwantread.obj $(BUILDDIR)io_dontwantwrite.obj $(BUILDDIR)io_dup.obj $(BUILDDIR)io_eagain.obj $(BUILDDIR)io_eagain_read.obj $(BUILDDIR)io_eagain_write.obj $(BUILDDIR)io_fd.obj $(BUILDDIR)io_finishandshutdown.obj $(BUILDDIR)io_getcookie.obj $(BUILDDIR)io_mmapwritefile.obj $(BUILDDIR)io_nonblock.obj $(BUILDDIR)io_pipe.obj $(BUILDDIR)io_readfile.obj $(BUILDDIR)io_readwritefile.obj $(BUILDDIR)io_sendfile.obj $(BUILDDIR)io_setcookie.obj $(BUILDDIR)io_sigpipe.obj $(BUILDDIR)io_socketpair.obj $(BUILDDIR)io_timedout.obj $(BUILDDIR)io_timeout.obj $(BUILDDIR)io_timeouted.obj $(BUILDDIR)io_tryread.obj $(BUILDDIR)io_tryreadtimeout.obj $(BUILDDIR)io_trywrite.obj $(BUILDDIR)io_trywritetimeout.obj $(BUILDDIR)io_wait.obj $(BUILDDIR)io_waitread.obj $(BUILDDIR)io_waituntil.obj $(BUILDDIR)io_waituntil2.obj $(BUILDDIR)io_waitwrite.obj $(BUILDDIR)io_wantread.obj $(BUILDDIR)io_wantwrite.obj $(BUILDDIR)iopause.obj

$(BUILDDIR)json.a: $(BUILDDIR)json_free.obj $(BUILDDIR)json_newnode.obj $(BUILDDIR)json_parse.obj $(BUILDDIR)json_print.obj $(BUILDDIR)json_read_callback.obj $(BUILDDIR)json_read_tree.obj $(BUILDDIR)json_reader_init.obj

$(BUILDDIR)list.a: $(BUILDDIR)list_add_after.obj $(BUILDDIR)list_add_before.obj $(BUILDDIR)list_find.obj $(BUILDDIR)list_find_remove.obj $(BUILDDIR)list_init.obj $(BUILDDIR)list_length.obj $(BUILDDIR)list_move_head.obj $(BUILDDIR)list_move_tail.obj $(BUILDDIR)list_push.obj $(BUILDDIR)list_remove.obj $(BUILDDIR)list_swap.obj $(BUILDDIR)list_unshift.obj

$(BUILDDIR)map.a: $(BUILDDIR)map_deinit.obj $(BUILDDIR)map_get.obj $(BUILDDIR)map_getref.obj $(BUILDDIR)map_iter.obj $(BUILDDIR)map_next.obj $(BUILDDIR)map_remove.obj $(BUILDDIR)map_set.obj

$(BUILDDIR)mmap.a: $(BUILDDIR)mmap_map.obj $(BUILDDIR)mmap_private.obj $(BUILDDIR)mmap_private_fd.obj $(BUILDDIR)mmap_read.obj $(BUILDDIR)mmap_read_fd.obj $(BUILDDIR)mmap_rw_fd.obj $(BUILDDIR)mmap_shared.obj $(BUILDDIR)mmap_shared_fd.obj $(BUILDDIR)mmap_unmap.obj

$(BUILDDIR)ndelay.a: $(BUILDDIR)ndelay_off.obj $(BUILDDIR)ndelay_on.obj

$(BUILDDIR)open.a: $(BUILDDIR)open_append.obj $(BUILDDIR)open_excl.obj $(BUILDDIR)open_read.obj $(BUILDDIR)open_rw.obj $(BUILDDIR)open_trunc.obj $(BUILDDIR)open_write.obj $(BUILDDIR)openreadclose.obj $(BUILDDIR)readclose.obj

$(BUILDDIR)path.a: $(BUILDDIR)fork.obj $(BUILDDIR)getdelim.obj $(BUILDDIR)path_absolute.obj $(BUILDDIR)path_basename.obj $(BUILDDIR)path_canonicalize.obj $(BUILDDIR)path_dirname.obj $(BUILDDIR)path_exists.obj $(BUILDDIR)path_fnmatch.obj $(BUILDDIR)path_getcwd.obj $(BUILDDIR)path_gethome.obj $(BUILDDIR)path_len.obj $(BUILDDIR)path_len_s.obj $(BUILDDIR)path_num.obj $(BUILDDIR)path_num_sa.obj $(BUILDDIR)path_readlink.obj $(BUILDDIR)path_realpath.obj $(BUILDDIR)path_right.obj $(BUILDDIR)path_skip.obj $(BUILDDIR)path_skips.obj $(BUILDDIR)path_split.obj $(BUILDDIR)pipe2.obj $(BUILDDIR)readlink.obj $(BUILDDIR)symlink.obj $(BUILDDIR)wordexp.obj

$(BUILDDIR)pe.a: $(BUILDDIR)pe_get_datadir.obj $(BUILDDIR)pe_get_section.obj $(BUILDDIR)pe_get_value.obj $(BUILDDIR)pe_header.obj $(BUILDDIR)pe_offset2rva.obj $(BUILDDIR)pe_rva2offset.obj $(BUILDDIR)pe_rva2ptr.obj $(BUILDDIR)pe_thunk.obj

$(BUILDDIR)playlist.a: $(BUILDDIR)playlist_init.obj $(BUILDDIR)playlist_m3u.obj $(BUILDDIR)playlist_pls.obj $(BUILDDIR)playlist_read.obj $(BUILDDIR)playlist_write_entry.obj $(BUILDDIR)playlist_write_finish.obj $(BUILDDIR)playlist_write_start.obj $(BUILDDIR)playlist_xspf.obj

$(BUILDDIR)rdir.a: $(BUILDDIR)rdir_close.obj $(BUILDDIR)rdir_open.obj $(BUILDDIR)rdir_read.obj

$(BUILDDIR)scan.a: $(BUILDDIR)scan_8int.obj $(BUILDDIR)scan_8long.obj $(BUILDDIR)scan_octal.obj $(BUILDDIR)scan_8longn.obj $(BUILDDIR)scan_8short.obj $(BUILDDIR)scan_asn1derlength.obj $(BUILDDIR)scan_asn1dertag.obj $(BUILDDIR)scan_charsetnskip.obj $(BUILDDIR)scan_double.obj $(BUILDDIR)scan_fromhex.obj $(BUILDDIR)scan_httpdate.obj $(BUILDDIR)scan_int.obj $(BUILDDIR)scan_long.obj $(BUILDDIR)scan_longlong.obj $(BUILDDIR)scan_longn.obj $(BUILDDIR)scan_netstring.obj $(BUILDDIR)scan_noncharsetnskip.obj $(BUILDDIR)scan_nonwhitenskip.obj $(BUILDDIR)scan_pb_tag.obj $(BUILDDIR)scan_pb_type0_sint.obj $(BUILDDIR)scan_pb_type1_fixed64.obj $(BUILDDIR)scan_pb_type5_fixed32.obj $(BUILDDIR)scan_plusminus.obj $(BUILDDIR)scan_short.obj $(BUILDDIR)scan_uint.obj $(BUILDDIR)scan_ulong.obj $(BUILDDIR)scan_ulonglong.obj $(BUILDDIR)scan_ulongn.obj $(BUILDDIR)scan_ushort.obj $(BUILDDIR)scan_utf8.obj $(BUILDDIR)scan_varint.obj $(BUILDDIR)scan_whitenskip.obj $(BUILDDIR)scan_xint.obj $(BUILDDIR)scan_xlong.obj $(BUILDDIR)scan_xlonglong.obj $(BUILDDIR)scan_xlongn.obj $(BUILDDIR)scan_xmlescape.obj $(BUILDDIR)scan_xshort.obj

$(BUILDDIR)sig.a: $(BUILDDIR)sig_block.obj $(BUILDDIR)sig_unblock.obj

$(BUILDDIR)slist.a: $(BUILDDIR)slist_add_after.obj $(BUILDDIR)slist_add_before.obj $(BUILDDIR)slist_find.obj $(BUILDDIR)slist_find_remove.obj $(BUILDDIR)slist_init.obj $(BUILDDIR)slist_length.obj $(BUILDDIR)slist_move_head.obj $(BUILDDIR)slist_move_tail.obj $(BUILDDIR)slist_push.obj $(BUILDDIR)slist_pushs.obj $(BUILDDIR)slist_remove.obj $(BUILDDIR)slist_unshift.obj

$(BUILDDIR)socket.a: $(BUILDDIR)fmt_ip4.obj $(BUILDDIR)fmt_ip6.obj $(BUILDDIR)fmt_ip6_flat.obj $(BUILDDIR)fmt_ip6c.obj $(BUILDDIR)fmt_ip6if.obj $(BUILDDIR)fmt_ip6ifc.obj $(BUILDDIR)init.obj $(BUILDDIR)scan_ip4.obj $(BUILDDIR)scan_ip6.obj $(BUILDDIR)scan_ip6_flat.obj $(BUILDDIR)scan_ip6if.obj $(BUILDDIR)socket_accept4.obj $(BUILDDIR)socket_accept6.obj $(BUILDDIR)socket_bind4.obj $(BUILDDIR)socket_bind4_reuse.obj $(BUILDDIR)socket_bind6.obj $(BUILDDIR)socket_bind6_reuse.obj $(BUILDDIR)socket_broadcast.obj $(BUILDDIR)socket_connect4.obj $(BUILDDIR)socket_connect6.obj $(BUILDDIR)socket_connected.obj $(BUILDDIR)socket_deferaccept.obj $(BUILDDIR)socket_fastopen.obj $(BUILDDIR)socket_fastopen_connect4.obj $(BUILDDIR)socket_fastopen_connect6.obj $(BUILDDIR)socket_getifidx.obj $(BUILDDIR)socket_getifname.obj $(BUILDDIR)socket_ip4loopback.obj $(BUILDDIR)socket_listen.obj $(BUILDDIR)socket_local4.obj $(BUILDDIR)socket_local6.obj $(BUILDDIR)socket_mchopcount6.obj $(BUILDDIR)socket_mcjoin4.obj $(BUILDDIR)socket_mcjoin6.obj $(BUILDDIR)socket_mcleave4.obj $(BUILDDIR)socket_mcleave6.obj $(BUILDDIR)socket_mcloop4.obj $(BUILDDIR)socket_mcloop6.obj $(BUILDDIR)socket_mcttl4.obj $(BUILDDIR)socket_noipv6.obj $(BUILDDIR)socket_quickack.obj $(BUILDDIR)socket_recv4.obj $(BUILDDIR)socket_recv6.obj $(BUILDDIR)socket_remote4.obj $(BUILDDIR)socket_remote6.obj $(BUILDDIR)socket_sctp4.obj $(BUILDDIR)socket_sctp4b.obj $(BUILDDIR)socket_sctp6.obj $(BUILDDIR)socket_sctp6b.obj $(BUILDDIR)socket_send4.obj $(BUILDDIR)socket_send6.obj $(BUILDDIR)socket_tcp4.obj $(BUILDDIR)socket_tcp4b.obj $(BUILDDIR)socket_tcp6.obj $(BUILDDIR)socket_tcp6b.obj $(BUILDDIR)socket_tryreservein.obj $(BUILDDIR)socket_udp4.obj $(BUILDDIR)socket_udp6.obj $(BUILDDIR)socket_v4mappedprefix.obj $(BUILDDIR)socket_v6any.obj $(BUILDDIR)socket_v6loopback.obj $(BUILDDIR)winsock2errno.obj $(BUILDDIR)winsock_init.obj $(BUILDDIR)winsock_socketpair.obj

$(BUILDDIR)str.a: $(BUILDDIR)str_basename.obj $(BUILDDIR)str_case_diff.obj $(BUILDDIR)str_case_diffn.obj $(BUILDDIR)str_case_equal.obj $(BUILDDIR)str_case_start.obj $(BUILDDIR)str_cat.obj $(BUILDDIR)str_chr.obj $(BUILDDIR)str_copy.obj $(BUILDDIR)str_copyb.obj $(BUILDDIR)str_copyn.obj $(BUILDDIR)str_decamelize.obj $(BUILDDIR)str_diff.obj $(BUILDDIR)str_diffn.obj $(BUILDDIR)str_dup.obj $(BUILDDIR)str_equal.obj $(BUILDDIR)str_find.obj $(BUILDDIR)str_findb.obj $(BUILDDIR)str_istr.obj $(BUILDDIR)str_len.obj $(BUILDDIR)str_lower.obj $(BUILDDIR)str_ndup.obj $(BUILDDIR)str_ptime.obj $(BUILDDIR)str_rchr.obj $(BUILDDIR)str_rchrs.obj $(BUILDDIR)str_start.obj $(BUILDDIR)str_tok.obj

$(BUILDDIR)stralloc.a: $(BUILDDIR)mmap_filename.obj $(BUILDDIR)stralloc_0.obj $(BUILDDIR)stralloc_append.objbj $(BUILDDIR)stralloc_case_diff.obj $(BUILDDIR)stralloc_case_diffs.obj $(BUILDDIR)stralloc_case_end.obj $(BUILDDIR)stralloc_case_equal.obj $(BUILDDIR)stralloc_case_equals.obj $(BUILDDIR)stralloc_case_start.obj $(BUILDDIR)stralloc_case_starts.obj $(BUILDDIR)stralloc_cat.obj $(BUILDDIR)stralloc_catb.obj $(BUILDDIR)stralloc_catc.obj $(BUILDDIR)stralloc_catdouble.obj $(BUILDDIR)stralloc_cathexb.obj $(BUILDDIR)stralloc_catint.obj $(BUILDDIR)stralloc_catint0.obj $(BUILDDIR)stralloc_catlong.obj $(BUILDDIR)stralloc_catlong0.obj $(BUILDDIR)stralloc_catm_internal.obj $(BUILDDIR)stralloc_cats.obj $(BUILDDIR)stralloc_catuint.obj $(BUILDDIR)stralloc_catuint0.obj $(BUILDDIR)stralloc_catulong.obj $(BUILDDIR)stralloc_catulong0.obj $(BUILDDIR)stralloc_catxlong.obj $(BUILDDIR)stralloc_chomp.obj $(BUILDDIR)stralloc_chop.obj $(BUILDDIR)stralloc_chr.obj $(BUILDDIR)stralloc_copy.obj $(BUILDDIR)stralloc_copyb.obj $(BUILDDIR)stralloc_copys.obj $(BUILDDIR)stralloc_copywcb.obj $(BUILDDIR)stralloc_copywcs.obj $(BUILDDIR)stralloc_count.obj $(BUILDDIR)stralloc_decamelize.obj $(BUILDDIR)stralloc_diff.obj $(BUILDDIR)stralloc_diffb.obj $(BUILDDIR)stralloc_diffs.obj $(BUILDDIR)stralloc_endb.obj $(BUILDDIR)stralloc_ends.obj $(BUILDDIR)stralloc_equal.obj $(BUILDDIR)stralloc_equalb.obj $(BUILDDIR)stralloc_equals.obj $(BUILDDIR)stralloc_erase.obj $(BUILDDIR)stralloc_expand.obj $(BUILDDIR)stralloc_find.obj $(BUILDDIR)stralloc_findb.obj $(BUILDDIR)stralloc_finds.obj $(BUILDDIR)stralloc_fmt.obj $(BUILDDIR)stralloc_fmt_call.obj $(BUILDDIR)stralloc_fmt_pred.obj $(BUILDDIR)stralloc_free.obj $(BUILDDIR)stralloc_init.obj $(BUILDDIR)stralloc_insert.obj $(BUILDDIR)stralloc_insertb.obj $(BUILDDIR)stralloc_inserts.obj $(BUILDDIR)stralloc_lower.obj $(BUILDDIR)stralloc_move.obj $(BUILDDIR)stralloc_nul.obj $(BUILDDIR)stralloc_prepend.obj $(BUILDDIR)stralloc_prependb.obj $(BUILDDIR)stralloc_prepends.obj $(BUILDDIR)stralloc_rchr.obj $(BUILDDIR)stralloc_ready.obj $(BUILDDIR)stralloc_ready_tuned.obj $(BUILDDIR)stralloc_readyplus.obj $(BUILDDIR)stralloc_remove.obj $(BUILDDIR)stralloc_remove_all.obj $(BUILDDIR)stralloc_replace.obj $(BUILDDIR)stralloc_replace_non_printable.obj $(BUILDDIR)stralloc_reverse.obj $(BUILDDIR)stralloc_reverse_blocks.obj $(BUILDDIR)stralloc_scan.obj $(BUILDDIR)stralloc_shrink.obj $(BUILDDIR)stralloc_start.obj $(BUILDDIR)stralloc_startb.obj $(BUILDDIR)stralloc_starts.obj $(BUILDDIR)stralloc_subst.obj $(BUILDDIR)stralloc_trim.obj $(BUILDDIR)stralloc_trunc.obj $(BUILDDIR)stralloc_upper.obj $(BUILDDIR)stralloc_write.obj $(BUILDDIR)stralloc_zero.obj

$(BUILDDIR)strarray.a: $(BUILDDIR)fnmatch.obj $(BUILDDIR)strarray_appends.obj $(BUILDDIR)strarray_from_argv.obj $(BUILDDIR)strarray_index_of.obj $(BUILDDIR)strarray_joins.obj $(BUILDDIR)strarray_pop.obj $(BUILDDIR)strarray_prepends.obj $(BUILDDIR)strarray_push.obj $(BUILDDIR)strarray_push_sa.obj $(BUILDDIR)strarray_pushb.obj $(BUILDDIR)strarray_pushd.obj $(BUILDDIR)strarray_removeprefixs.obj $(BUILDDIR)strarray_removesuffixs.obj $(BUILDDIR)strarray_set.obj $(BUILDDIR)strarray_sort.obj $(BUILDDIR)strarray_to_argv.obj

$(BUILDDIR)strlist.a: $(BUILDDIR)strlist_append_sa.obj $(BUILDDIR)strlist_at.obj $(BUILDDIR)strlist_at_n.obj $(BUILDDIR)strlist_at_sa.obj $(BUILDDIR)strlist_cat.obj $(BUILDDIR)strlist_contains.obj $(BUILDDIR)strlist_contains_sa.obj $(BUILDDIR)strlist_count.obj $(BUILDDIR)strlist_dump.obj $(BUILDDIR)strlist_froms.obj $(BUILDDIR)strlist_index_of.obj $(BUILDDIR)strlist_join.obj $(BUILDDIR)strlist_joins.obj $(BUILDDIR)strlist_prepend_sa.obj $(BUILDDIR)strlist_prependb.obj $(BUILDDIR)strlist_prepends.obj $(BUILDDIR)strlist_push.obj $(BUILDDIR)strlist_push_sa.obj $(BUILDDIR)strlist_push_tokens.obj $(BUILDDIR)strlist_push_unique.obj $(BUILDDIR)strlist_push_unique_sa.obj $(BUILDDIR)strlist_pushb.obj $(BUILDDIR)strlist_pushm_internal.obj $(BUILDDIR)strlist_range.obj $(BUILDDIR)strlist_shift.obj $(BUILDDIR)strlist_shift_n.obj $(BUILDDIR)strlist_sort.obj $(BUILDDIR)strlist_to_argv.obj $(BUILDDIR)strlist_unshift.obj

$(BUILDDIR)tai.a: $(BUILDDIR)tai_add.obj $(BUILDDIR)tai_now.obj $(BUILDDIR)tai_pack.obj $(BUILDDIR)tai_sub.obj $(BUILDDIR)tai_uint.obj $(BUILDDIR)tai_unpack.obj

$(BUILDDIR)taia.a: $(BUILDDIR)taia_add.obj $(BUILDDIR)taia_addsec.obj $(BUILDDIR)taia_approx.obj $(BUILDDIR)taia_frac.obj $(BUILDDIR)taia_half.obj $(BUILDDIR)taia_less.obj $(BUILDDIR)taia_now.obj $(BUILDDIR)taia_pack.obj $(BUILDDIR)taia_sub.obj $(BUILDDIR)taia_tai.obj $(BUILDDIR)taia_uint.obj $(BUILDDIR)taia_unpack.obj

$(BUILDDIR)textbuf.a: $(BUILDDIR)is_textbuf.obj $(BUILDDIR)textbuf_column.obj $(BUILDDIR)textbuf_free.obj $(BUILDDIR)textbuf_init.obj $(BUILDDIR)textbuf_line.obj $(BUILDDIR)textbuf_read.obj

$(BUILDDIR)uint16.a: $(BUILDDIR)uint16_pack.obj $(BUILDDIR)uint16_pack_big.obj $(BUILDDIR)uint16_read.obj $(BUILDDIR)uint16_read_big.obj $(BUILDDIR)uint16_unpack.obj $(BUILDDIR)uint16_unpack_big.obj

$(BUILDDIR)uint32.a: $(BUILDDIR)uint32_pack.obj $(BUILDDIR)uint32_pack_big.obj $(BUILDDIR)uint32_read.obj $(BUILDDIR)uint32_read_big.obj $(BUILDDIR)uint32_unpack.obj $(BUILDDIR)uint32_unpack_big.obj

$(BUILDDIR)uint64.a: $(BUILDDIR)uint64_pack.obj $(BUILDDIR)uint64_pack_big.obj $(BUILDDIR)uint64_read.obj $(BUILDDIR)uint64_read_big.obj $(BUILDDIR)uint64_unpack.obj $(BUILDDIR)uint64_unpack_big.obj

$(BUILDDIR)var.a: $(BUILDDIR)var_bsearch.obj $(BUILDDIR)var_chflg.obj $(BUILDDIR)var_cleanup.obj $(BUILDDIR)var_copys.obj $(BUILDDIR)var_count.obj $(BUILDDIR)var_create.obj $(BUILDDIR)var_dump.obj $(BUILDDIR)var_export.obj $(BUILDDIR)var_get.obj $(BUILDDIR)var_hsearch.obj $(BUILDDIR)var_import.obj $(BUILDDIR)var_init.obj $(BUILDDIR)var_len.obj $(BUILDDIR)var_lexhash.obj $(BUILDDIR)var_print.obj $(BUILDDIR)var_rndhash.obj $(BUILDDIR)var_search.obj $(BUILDDIR)var_set.obj $(BUILDDIR)var_setsa.obj $(BUILDDIR)var_setvint.obj $(BUILDDIR)var_setvsa.obj $(BUILDDIR)var_unset.obj $(BUILDDIR)var_valid.obj $(BUILDDIR)var_value.obj $(BUILDDIR)var_vdefault.obj $(BUILDDIR)var_vlen.obj

$(BUILDDIR)vartab.a: $(BUILDDIR)vartab_add.obj $(BUILDDIR)vartab_cleanup.obj $(BUILDDIR)vartab_dump.obj $(BUILDDIR)vartab_hash.obj $(BUILDDIR)vartab_pop.obj $(BUILDDIR)vartab_print.obj $(BUILDDIR)vartab_push.obj $(BUILDDIR)vartab_root.obj $(BUILDDIR)vartab_search.obj

$(BUILDDIR)xml.a: $(BUILDDIR)xml_add_child.obj $(BUILDDIR)xml_attrnode.obj $(BUILDDIR)xml_content.obj $(BUILDDIR)xml_content_sa.obj $(BUILDDIR)xml_debug.obj $(BUILDDIR)xml_delete.obj $(BUILDDIR)xml_element.obj $(BUILDDIR)xml_escape.obj $(BUILDDIR)xml_find_all_pred.obj $(BUILDDIR)xml_find_element.obj $(BUILDDIR)xml_find_element_attr.obj $(BUILDDIR)xml_find_parent.obj $(BUILDDIR)xml_find_pred.obj $(BUILDDIR)xml_find_predicates.obj $(BUILDDIR)xml_free.obj $(BUILDDIR)xml_get_attribute.obj $(BUILDDIR)xml_get_attribute_double.obj $(BUILDDIR)xml_get_attribute_sa.obj $(BUILDDIR)xml_get_document.obj $(BUILDDIR)xml_has_attribute.obj $(BUILDDIR)xml_insert.obj $(BUILDDIR)xml_newnode.obj $(BUILDDIR)xml_path.obj $(BUILDDIR)xml_print.obj $(BUILDDIR)xml_print_attributes.obj $(BUILDDIR)xml_print_nodeset.obj $(BUILDDIR)xml_read_callback.obj $(BUILDDIR)xml_read_tree.obj $(BUILDDIR)xml_reader_init.obj $(BUILDDIR)xml_remove.obj $(BUILDDIR)xml_root_element.obj $(BUILDDIR)xml_set_attribute.obj $(BUILDDIR)xml_set_attribute_double.obj $(BUILDDIR)xml_textnode.obj
