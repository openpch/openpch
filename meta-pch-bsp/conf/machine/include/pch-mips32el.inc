# pch-mips32el.inc

DREAMBOX_KERNEL_VERSION = "2.6.22"
LINUXLIBCVERSION = "2.6.22"
OLDEST_KERNEL = "2.6"

TARGET_ARCH = "mipsel"
DEFAULTTUNE = "74kc"

require conf/machine/include/pch.inc
require conf/machine/include/tune-74kc.inc
