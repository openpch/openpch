# Specific options for openpch
PACKAGECONFIG ?= "static"

PACKAGECONFIG[static] = "--enable-static --disable-shared, --enable-shared,,"

EXTRA_OECONF += "\
  CFLAGS=--static LDFLAGS=--static \
  --with-opkgetcdir=${sysconfdir} \
"
