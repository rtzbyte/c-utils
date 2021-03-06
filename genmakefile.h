#ifndef _GENMAKEFILE_H
#define _GENMAKEFILE_H

#include "lib/windoze.h"
#include "lib/unix.h"
#include "lib/mmap.h"
#include "lib/open.h"
#include "lib/path.h"
#include "lib/rdir.h"
#include "lib/scan.h"
#include "lib/slist.h"
#include "lib/str.h"
#include "lib/stralloc.h"
#include "lib/strarray.h"
#include "lib/strlist.h"
#include "lib/uint32.h"
#include "lib/errmsg.h"
#include "lib/array.h"
#include "lib/byte.h"
#include "lib/fmt.h"
#include "lib/dir.h"
#include "lib/range.h"
#include "lib/case.h"
#include "map.h"

typedef enum { OS_WIN, OS_MAC, OS_LINUX } os_type;

#if WINDOWS
#define MAX_CMD_LEN 1023

#define DEFAULT_OBJEXT ".obj"
#define DEFAULT_LIBEXT ".lib"
#define DEFAULT_LIBPFX ""
#define DEFAULT_EXEEXT ".exe"
#define DEFAULT_PPSEXT ".pp.c"
#else
#define MAX_CMD_LEN 8191

#define DEFAULT_OBJEXT ".o"
#define DEFAULT_LIBEXT ".a"
#define DEFAULT_LIBPFX "lib"
#define DEFAULT_EXEEXT ""
#define DEFAULT_PPSEXT ".pp.c"
#endif

#if WINDOWS_NATIVE
#define DEFAULT_PATHSEP '\\'
#else
#define DEFAULT_PATHSEP '/'
#endif

typedef struct {
  enum { X86, ARM, PIC } arch;
  enum { _14, _16, _32, _64 } bits;
} machine_type;

typedef struct {
  os_type os;
  enum { NTOS, UNIX } type;
} system_type;

typedef struct {
  struct slink link;
  const char* name;
  int has_main;
  strlist includes;
  strlist deps;
  strlist pptoks;
} sourcefile;

typedef struct {
  int n_sources;
  slink* sources;
  strlist includes;
  array rules;
  strlist pptoks;
  strlist deps;
  uint32 serial;
} sourcedir;

typedef struct target_s {
  const char* name;
  strlist output;
  strlist prereq;
  stralloc recipe;
  array deps;
  array objs;
  uint32 serial;
  strlist vars;
} target;

typedef struct {
  strlist work;
  strlist build;
  strlist out;
  strlist this;
} dirs_t;

typedef struct {
  char* obj;
  char* lib;
  char* bin;
  char* pps;
} exts_t;

typedef struct {
  char* toolchain;
  char* compiler;
  char* make;
  char* preproc;
} tools_t;

typedef enum {
  BUILD_TYPE_RELEASE = 0,
  BUILD_TYPE_RELWITHDEBINFO,
  BUILD_TYPE_MINSIZEREL,
  BUILD_TYPE_DEBUG,
} build_type_t;

typedef struct {
  machine_type mach;
  system_type sys;
  stralloc chip;
  int build_type;
} config_t;
void add_path_b(strlist*, const char*, size_t);
void add_path_relativeb(strlist*, stralloc*, const char*, size_t pathlen);
void add_path_sa(strlist*, stralloc*);
void add_path(strlist*, const char*);
void add_srcpath(strlist*, const char*);
void deps_direct(strlist*, const target*);
void deps_for_libs(void);
void deps_indirect(strlist*, const strlist*);
char* dirname_alloc(const char*);
int extract_build_type(const stralloc*);
void extract_pptok(const char*, size_t, strlist*);
void extract_tokens(const char*, size_t, strlist*);
int filter_pptoks(const void*, size_t);
void format_linklib_dummy(const char*, stralloc*);
void format_linklib_lib(const char*, stralloc*);
void format_linklib_switch(const char*, stralloc*);
void gen_clean_rule(void);
target* gen_install_rules(void);
void gen_lib_rules(void);
int gen_link_rules(void);
target* gen_simple_compile_rules(sourcedir*, const char*, const char*, const char* toext, stralloc* cmd);
target* gen_single_rule(stralloc*, strlist*, stralloc*);
target* gen_srcdir_compile_rules(sourcedir*, const char*);
target* gen_srcdir_lib_rule(sourcedir*, const char*);
void gen_srcdir_rule(sourcedir*, const char*);
void get_keys(MAP_T*, strlist*);
void get_ref_vars(const stralloc*, strlist*);
void get_rules_by_cmd(stralloc*, strlist*);
void includes_add(const char*);
void includes_cppflags(void);
void includes_extract(const char*, size_t, strlist*, int sys);
int includes_get(const char*, strlist*, int);
void includes_to_libs(const strlist*, strlist*);
int input_command_line(const char*, size_t);
int is_filename_b(const char*, size_t);
int is_filename(const char*);
int is_filename_sa(stralloc*);
int is_include_b(const char*, size_t);
int is_include(const char*);
int is_include_sa(stralloc*);
int is_object(const char*);
int is_object_sa(stralloc*);
int is_source_b(const char*, size_t);
int is_source(const char*);
int is_source_sa(stralloc*);
int main_present(const char*);
int main_scan(const char*, size_t);
int mkdir_components(strlist*, int);
int mkdir_sa(const stralloc*, int);
void output_all_rules(buffer*);
void output_all_vars(buffer*, MAP_T*, strlist*);
void output_build_rules(buffer*, const char*, const stralloc*);
void output_make_rule(buffer*, target*);
void output_ninja_rule(buffer*, target*);
void output_script(buffer*, target*);
char* path_extension(const char*, stralloc*, const char*);
const char* path_mmap_read(const char*, size_t*);
char* path_output(const char*, stralloc*, const char*);
void path_prefix_b(const stralloc*, const char*, size_t, stralloc* out);
void path_prefix_sa(const stralloc*, stralloc*);
void path_prefix_s(const stralloc*, const char*, stralloc*);
char* path_wildcard(stralloc*, const char*);
void print_rule_deps(buffer*, target*);
void print_rule_deps_r(buffer*, target*, strlist*, strlist* hierlist, int depth);
void push_define(const char*);
void push_lib(const char*, const char*);
void put_newline(buffer*, int);
ssize_t remove_indirect_deps(array*);
void remove_indirect_deps_recursive(array*, array*, int);
void rule_add_deps(target*, const strlist*);
int rule_add_dep(target*, target*);
void rule_command_subst(target*, stralloc*, const char*, size_t plen);
void rule_command(target*, stralloc*);
void rule_dep_list_recursive(target*, strlist*, int, strlist* hier);
void rule_dep_list(target*, strlist*);
void rule_deps_indirect(target*, strlist*);
void rule_dump(target*);
target* rule_find_b(const char*, size_t);
target* rule_find(const char*);
target* rule_find_sa(stralloc*);
target* rule_get(const char*);
target* rule_get_sa(stralloc*);
int rule_match(target*, const char*);
void rule_rename(target*, const char*);
int set_chip(const char*);
void set_command(stralloc*, const char*, const char*);
int set_compiler_type(const char*);
int set_machine(const char*);
int set_make_type(void);
int set_system(const char*);
size_t skip_comment(const char*, size_t);
void sourcedir_addsource(const char*, strarray*);
void sourcedir_deps_b(const char*, size_t, strlist*);
void sourcedir_deps_s(const char*, strlist*);
void sourcedir_deps(sourcedir*, strlist*);
void sourcedir_dump_all(buffer*);
sourcedir* sourcedir_findb(const char*, size_t);
sourcedir* sourcedir_find(const char*);
sourcedir* sourcedir_find_sa(stralloc*);
sourcedir* sourcedir_get_b(const char*, size_t);
sourcedir* sourcedir_get_sa(stralloc*);
void sourcedir_populate(strarray*);
int sources_add_b(const char*, size_t);
int sources_add(const char*);
void sources_deps(sourcefile*, strlist*);
const char* sources_find(const char*, size_t, size_t*);
void sources_get(const char*);
sourcefile* sources_new(const char*);
void sources_readdir(stralloc*, strarray*);
int sources_sort(const char**, const char**);
void stralloc_weak(stralloc*, const stralloc*);
void strarray_dump(buffer*, const strarray*);
void target_ptrs(const strlist*, array*);
const char* var_get(const char*);
int var_isset(const char*);
strlist* var_list(const char*);
void var_output(buffer*, MAP_T*, const char*);
void var_push(const char*, const char*);
void var_push_sa(const char*, stralloc*);
strlist* var_set(const char*, const char*);
void var_subst(const stralloc*, stralloc*, const char*, const char* sfx, int tolower);
void var_unset(const char*);
void with_lib(const char*);

extern exts_t exts;
extern config_t cfg;
extern dirs_t dirs;
extern strarray srcs;
extern tools_t tools;

#endif
