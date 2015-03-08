# pch.inc

GLIBC_EXTRA_OECONF = "--with-tls --with-__thread"

MACHINE_FEATURES += "kernel26"

PREFERRED_PROVIDER_virtual/kernel = "linux-pch"
