define nl =


endef
$(info nl: A$(nl)A)

target-tmpl := $(if $(3),$(call clean-target,$(1)): LIBS += $(call flags-lib,$(3))$(nl))$(call clean-target,$(1)): $(2) $(if $(3),| $(3),)$(nl)	$(call is-archive,$(1),$$(AR) rcs $$@ $$^,$(call is-object,$(1),$$(CROSS_COMPILE)$$(CC) $$(CFLAGS) $$(CPPFLAGS) $$(INCLUDES) $$(DEFS) -c -o$$@ $$<,$$(CROSS_COMPILE)$$(CC) $$(LDFLAGS) $$(CFLAGS) $$(CPPFLAGS) -o $$@ $$^ $$(LIBS) $$(EXTRA_LIBS)))$(nl)$(call is-archive,$(1),,ifeq ($$(DO_STRIP),1)$(nl)	$$(STRIP) $$@$(nl)endif$(nl))$(nl)


define lib-tmpl =
$(if $(4),$$(BUILDDIR)$(1).a: $(4))
$$(BUILDDIR)$(1).a: $$(call add-sources,$(if $(3),$(3),lib/$(1)/*.c) $(2))
	$$(AR) rcs $$@ $$^
$$(BUILDDIR)lib$(1).so: LDFLAGS += -shared -Wl,-rpath=$$(BUILDDIR:%/=%)
$$(BUILDDIR)lib$(1).so: $$(call add-sources,$(if $(3),$(3),lib/$(1)/*.c) $(2),.pic.o)
	$$(CROSS_COMPILE)$$(CC) $$(LDFLAGS) $$(EXTRA_LDFLAGS) $$(CFLAGS) $$(CPPFLAGS) -o $$@ $$^ $$(LIBS) $$(EXTRA_LIBS)
endef

lib-target = $(eval $(call lib-tmpl,$(1),$(2),$(3),$(4)))

define default-program
int main() {
	return 0;
}
endef

define cmds-try-compile =
set -xe; \
NAME=test_$$RANDOM; \
echo "$(if $(1),$(1),$(default-program))" >$$NAME.c; \
$(CROSS_COMPILE)$(CC)$(if $(SYSROOT), --sysroot=$(SYSROOT),) $(LDFLAGS) $(EXTRA_LDFLAGS) $(CFLAGS) $(CPPFLAGS) $(2) -o $$NAME $$NAME.c; 
endef

define prog-check-include =
#include <$(1)>
int main() {
  return 0;
}
endef

define cmds-include-exists =
set -e; \
NAME=test_$(subst .,_,$(subst /,_,$(1))); \
(echo "#include <$(1)>"; \
echo ""; \
echo "int main() {"; \
echo "  return 0;"; \
echo "}") >$$NAME.c; \
$(CROSS_COMPILE)$(CC)$(if $(SYSROOT), --sysroot=$(SYSROOT),) -c -o$$NAME $$NAME.c && R=0 || R=1; \
rm -f "$$NAME" "$$NAME.c"; exit $$R
endef

define cmds-try-compile =
set -e;  \
NAME=$$RANDOM; \
(echo "$(1)") >test_$$NAME.c; \
if $(CROSS_COMPILE)$(CC)$(if $(SYSROOT), --sysroot=$(SYSROOT),) $(LDFLAGS) $(EXTRA_LDFLAGS) -o test_$$NAME test_$$NAME.c $(2); then R=0; else R=1; fi; \
rm -f "test_$$NAME" "test_$$NAME.c"; exit $$R
endef

define cmds-function-exists =
set -e;  \
($(if $(3),$(foreach H,$(3),echo "#include <$(H)>";),echo "extern int $(1)();";) \
echo "int main() {"; \
echo "  void *ptr = &$(1);"; \
echo "  return (int)ptr;"; \
echo "}") >test_$(1).c; \
if $(CROSS_COMPILE)$(CC)$(if $(SYSROOT), --sysroot=$(SYSROOT),) $(LDFLAGS) $(EXTRA_LDFLAGS) -o test_$(1) test_$(1).c $(2); then R=0; else R=1; fi; \
rm -f "test_$(1)" "test_$(1).c"; exit $$R
endef

add-libdeps = $(patsubst %,$(BUILDDIR)lib%.so,$(1))

add-sources = $(patsubst %.c,$(BUILDDIR)%$(if $(2),$(2),.o),$(notdir $(wildcard $(1))))

check-try-compile = $(shell $(call cmds-exitcode,$(cmds-try-compile)))
check-function-exists = $(shell $(call cmds-exitcode,$(cmds-function-exists)))

check-include-exists = $(shell $(call cmds-exitcode,$(cmds-include-exists)))

# def-var NAME,VALUE
cmd-set-var = $(call header-to-var,$(1)) := $(2)
def-var = $(eval $(cmd-set-var))

def-function-exists = $(call def-var,HAVE_$(1),$(call check-function-exists,$(2),$(3)),$(DEFINES_FILE))

#def-include-exists = $(call def-var,HAVE_$(1),$(call check-include-exists,$(1)),$(DEFINES_FILE))
define def-include-exists =
$(call def-var,$(if $(2),$(2),HAVE_$(1)),$(call check-include-exists,$(1)),$(DEFINES_FILE))
$(if $($(if $(2),$(2),HAVE_$(call header-to-var))),$(call append-var,DEFINES,$(if $(2),$(2),HAVE_$(call header-to-var))=1))
endef

clean-lib = $(patsubst %.a,%,$(patsubst lib%.a,%,$(patsubst -l%,%,$(patsubst lib%.so,%,$(patsubst $(BUILDDIR)%,%,$(patsubst $$(BUILDDIR)%,%,$(1)))))))
clean-builddir = $(patsubst $$(BUILDDIR)%,%,$(patsubst $(BUILDDIR)%,%,$(1)))

clean-target = $(BUILDDIR)$(call clean-builddir,$(1))$(call is-archive,$(1),,$(_M64)$(EXEEXT))

cmds-exitcode = (set -x;  $(1)) >>checks.log 2>&1 && echo 1 || echo

define cmd-check-header =
HAVE_$(call header-to-var,$(1)) := $$(call check-include-exists,$(1))
$$(info HAVE_$(call header-to-var,$(1))=$$(HAVE_$(call header-to-var,$(1))))
endef

cmd-exists = $(shell set -x; type "$(1)" 2>/dev/null >/dev/null && echo 1 || echo 0)

echo-target = $(info $(call target-tmpl,$(1),$(2),$(3)))

file-exists = $(shell test -e "$(1)" 2>/dev/null >/dev/null && echo 1)

flags-lib = $(if $(1),-L$$(BUILDDIR:%/=%) $(patsubst %,-l%,$(call clean-lib,$(1))),)

define get-compiler-defs =
echo | $(CROSS_COMPILE)$(CC) $(1) -dM -E - | grep "^.define"
endef

header-to-var = $(shell echo "$(subst /,_,$(subst .,_,$(1)))" | tr "[[:lower:]]" "[[:upper:]]")

is-archive = $(if $(filter %.a,$(1)),$(2),$(3))

is-object = $(if $(filter %.o,$(1)),$(2),$(3))

set-var = $(eval $(1) := $(2))
append-var = $(eval $(1) += $(2))
set-target-var = $(eval $(call clean-target,$(1)): $(2) := $(3))
append-target-var = $(eval $(call clean-target,$(1)): $(2) += $(3))



create-target = $(eval $(call target-tmpl,$(1),$(2),$(3)))
