#include "windoze.h"

#if WINDOWS_NATIVE

#include "ioctlcmd.h"
#include <stdio.h>
#include <windows.h>
#include <winioctl.h>

#ifndef Newx
#  define Newx(v,n,t)                    v = (t*)malloc((n)); 
#endif

static BOOL
get_reparse_data(CONST TCHAR* LinkPath, union REPARSE_DATA_BUFFER_UNION* u) {
  HANDLE hFile;
  DWORD returnedLength;

  int attr = GetFileAttributes(LinkPath);

  if(!(attr & FILE_ATTRIBUTE_REPARSE_POINT)) {
    return FALSE;
  }

  hFile =
      CreateFile(LinkPath, 0, 0, NULL, OPEN_EXISTING, FILE_FLAG_OPEN_REPARSE_POINT | FILE_FLAG_BACKUP_SEMANTICS, NULL);

  if(hFile == INVALID_HANDLE_VALUE) {
    return FALSE;
  }

  /* Get the link */
  if(!DeviceIoControl(hFile, FSCTL_GET_REPARSE_POINT, NULL, 0, &u->iobuf, 1024, &returnedLength, NULL)) {

    CloseHandle(hFile);
    return FALSE;
  }

  CloseHandle(hFile);

  if(u->iobuf.ReparseTag != IO_REPARSE_TAG_MOUNT_POINT && u->iobuf.ReparseTag != IO_REPARSE_TAG_SYMLINK) {
    return FALSE;
  }

  return TRUE;
}

char*
readlink(CONST TCHAR* LinkPath) {
  union REPARSE_DATA_BUFFER_UNION u;

  if(!get_reparse_data(LinkPath, &u)) {
    return NULL;
  }

  switch(u.iobuf.ReparseTag) {
    case IO_REPARSE_TAG_MOUNT_POINT: { /* Junction */
      char* retval;
      unsigned int len = u.iobuf.MountPointReparseBuffer.SubstituteNameLength;

      Newx(retval, len + sizeof(WCHAR), char);

      sprintf(retval,
              "%.*S",
              u.iobuf.MountPointReparseBuffer.SubstituteNameLength / sizeof(WCHAR),
              u.iobuf.MountPointReparseBuffer.PathBuffer +
                  u.iobuf.MountPointReparseBuffer.SubstituteNameOffset / sizeof(WCHAR));

      retval += 4;
      return retval;
    }
    case IO_REPARSE_TAG_SYMLINK: { /* Symlink */
      char* retval;
      unsigned int len = u.iobuf.SymbolicLinkReparseBuffer.SubstituteNameLength;

      Newx(retval, len + sizeof(WCHAR), char);

      sprintf(retval,
              "%.*S",
              u.iobuf.SymbolicLinkReparseBuffer.SubstituteNameLength / sizeof(WCHAR),
              u.iobuf.SymbolicLinkReparseBuffer.PathBuffer +
                  u.iobuf.SymbolicLinkReparseBuffer.SubstituteNameOffset / sizeof(WCHAR));

      return retval;
    }
  }

  return NULL;
}

static DWORD
reparse_tag(CONST TCHAR* LinkPath) {
  union REPARSE_DATA_BUFFER_UNION u;

  if(!get_reparse_data(LinkPath, &u)) {
    return 0;
  }

  return u.iobuf.ReparseTag;
}

BOOL is_symlink(LinkPath) CONST TCHAR* LinkPath;
{ return reparse_tag(LinkPath) == IO_REPARSE_TAG_SYMLINK; }

BOOL is_junction(LinkPath) CONST TCHAR* LinkPath;
{ return reparse_tag(LinkPath) == IO_REPARSE_TAG_MOUNT_POINT; }

#endif /* WINDOWS */
