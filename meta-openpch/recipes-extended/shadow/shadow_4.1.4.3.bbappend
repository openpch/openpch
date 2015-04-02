EXTRA_OECONF += "ac_cv_func_lckpwdf=no "

# Change the path of the shadow files
do_configure_append() {
    cat >>${S}/config.h <<EOF
/*
 Force path of shadow files for openpch
*/
#define LOGINDEFS "${base_prefix_target}/etc/login.defs"
#define PASSWD_FILE "${base_prefix_target}/etc/passwd"
#define GROUP_FILE "${base_prefix_target}/etc/group"
#define SHADOW_FILE "${base_prefix_target}/etc/shadow"
#define SGROUP_FILE "${base_prefix_target}/etc/gshadow"
EOF
}
