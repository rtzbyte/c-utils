#include_directories("${CMAKE_SOURCE_DIR}")
include_directories(${CMAKE_SOURCE_DIR})

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

link_directories(${CMAKE_BINARY_DIR})

link_libraries( dns io textcode strlist errmsg path stralloc mmap str taia tai buffer open scan fmt uint32)
#set(EXAMPLES  
#  array buffer_1 buffer_fromsa buffer_mmap buffer_tosa byte_copy fmt 
#  #fmt_httpdate fmt_human fmt_ip6 fmt_long fmt_longlong fmt_strm_alloca 
#  io io2 io5 json 
#  #marshal
#  # mult  protobuf 
#  #proxy range
#   readhttp scan scan_long stralloc_buffer stralloc_chomp
#   # uint 
#   #utf8
#   proxy
#  )
#foreach(EXAMPLE ${EXAMPLES})
#  if(EXISTS "${EXAMPLE}_example.c")
#    set(SOURCE "${EXAMPLE}_example.c")
#  else(EXISTS "${EXAMPLE}_example.c")
#    set(SOURCE "${EXAMPLE}.c")
#  endif(EXISTS "${EXAMPLE}_example.c")
#    
##  message("Example: ${EXAMPLE}")
#add_executable(example_${EXAMPLE} "${SOURCE}")
#target_link_libraries(example_${EXAMPLE} io)
#endforeach(EXAMPLE ${EXAMPLES})
#

add_executable(proxy proxy.c)
add_executable(b64encode b64encode.c)
add_executable(buffer_1_example buffer_1_example.c)
add_executable(buffer_fromsa_example buffer_fromsa_example.c)
add_executable(buffer_mmap buffer_mmap.c)
add_executable(buffer_tosa_example buffer_tosa_example.c)
add_executable(byte_copy_example byte_copy_example.c)
#add_executable(cas cas.c)
#add_executable(cdbget2 cdbget2.c)
#add_executable(cescape cescape.c)
#add_executable(client client.c)
#add_executable(dllink dllink.c)
#add_executable(fdpassing fdpassing.c)
add_executable(fmt_httpdate_example fmt_httpdate_example.c)
add_executable(fmt_human_example fmt_human_example.c)
#	add_executable(fmt_ip6_example fmt_ip6_example.c)
#add_executable(fmt_iso8691 fmt_iso8691.c)
#add_executable(fmt_long_example fmt_long_example.c)
#add_executable(fmt_strm_alloca fmt_strm_alloca.c)
#add_executable(httpd httpd.c)
add_executable(io2 io2.c)
#add_executable(io3 io3.c)
add_executable(io4 io4.c)
add_executable(io5 io5.c)
#add_executable(iob iob.c)
#add_executable(iom iom.c)
add_executable(longlong longlong.c)
#add_executable(marshal marshal.c)
add_executable(mult mult.c)
#add_executable(netstring netstring.c)
#add_executable(protobuf protobuf.c)
add_executable(readhttp readhttp.c)
add_executable(scan_long_example scan_long_example.c)
#add_executable(server server.c)
add_executable(stralloc_buffer stralloc_buffer.c)
add_executable(stralloc_chomp_example stralloc_chomp_example.c)
add_executable(uint uint.c)
add_executable(unurl unurl.c)
add_executable(urlencode urlencode.c)
#add_e+xec+utable(utf8_example utf8_example.c)
#add_executable(uudecode uudecode.c)
#add_executable(vd vd.c)

install(TARGETS proxy DESTINATION bin)
