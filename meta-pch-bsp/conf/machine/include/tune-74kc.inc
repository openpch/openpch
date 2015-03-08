# tune-74kc.inc
DEFAULTTUNE ?= "74kc"

require conf/machine/include/tune-mips32.inc

AVAILTUNES += "74kc"
TUNEVALID[74kc] = "Enable mips 74K specific processor optimizations"
TUNE_CONFLICTS[74kc] = "n64 n32"
TUNE_FEATURES_tune-74kc = "${TUNE_FEATURES_tune-mipsel} 74kc"
TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "74kc", "-march=74kc -mdsp -fPIC", "", d)}"

MIPSPKGSFX_VARIANT_tune-74kc = "mips32el"
PACKAGE_EXTRA_ARCHS_tune-74kc = "mipsel mips32el"

