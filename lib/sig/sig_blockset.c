#include "../sig.h"

#include <signal.h>

void
sig_blockset(sigset_t const* set) {
  sigprocmask(SIG_SETMASK, set, 0);
}
