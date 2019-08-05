#include "../vartab.h"
#include "../byte.h"
#include "../tree.h"
#include "../expand.h"

/* expand one N_ARG nodes to a stralloc (appending)
 */
void
expand_catsa(union node* node, stralloc* sa, struct vartab* varstack, char* argv[], int exitcode, int flags) {
  union node tmpnode;
  union node* n = &tmpnode;

  byte_copy(&tmpnode.narg.stra, sizeof(stralloc), sa);
  expand_arg(&node->narg, &n, varstack, argv, exitcode, flags | X_NOSPLIT);
  byte_copy(sa, sizeof(stralloc), &tmpnode.narg.stra);
  expand_unescape(sa);
  stralloc_nul(sa);
}

