require recipes-kernel/linux-libc-headers/linux-libc-headers.inc

SRC_URI += "file://makefile-implicit.patch"
SRC_URI += "file://linux-2.6.28.10-unifdef-getline.patch"

SRC_URI[md5sum] = "2e230d005c002fb3d38a3ca07c0200d0"
SRC_URI[sha256sum] = "73c10604c53f1a6ee65ef805293d23903696f8cef864f42d7de9506f0d2ba4c7"

