# add this dir in file search so we can overwrite opkg.conf
FILESEXTRAPATHS_prepend := "${THISDIR}:"

# Specific options for openpch
PACKAGECONFIG ?= "static"

PACKAGECONFIG[static] = "--enable-static --disable-shared, --enable-shared,,"

EXTRA_OECONF += "\
  CFLAGS=--static LDFLAGS=--static \
  --with-opkgetcdir=${sysconfdir} \
"
