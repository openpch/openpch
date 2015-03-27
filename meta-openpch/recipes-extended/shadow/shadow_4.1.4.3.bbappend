# Change the path of the shadow files
do_configure_append() {
    cat >>${S}/config.h <<EOF
/*
 Force path of shadow files for openpch
*/
#define PASSWD_FILE "${sysconfdir}/passwd"
#define GROUP_FILE "${sysconfdir}/group"
#define LOGINDEFS "${sysconfdir}/login.defs"
#define SHADOW_FILE ""
#define SGROUP_FILE ""
EOF
}
