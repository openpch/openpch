# Don't split the suid apps into a seperate binaries
BUSYBOX_SPLIT_SUID := "0"

# Fix the path of the etc and share directories
do_patch_append() {
    bb.build.exec_func('do_fix_paths', d)
    bb.build.exec_func('do_add_PATH', d)
}

do_fix_paths () {
    sed -i -e "s# /etc/# ${sysconfdir}/#g" ${WORKDIR}/syslog ${WORKDIR}/syslog.conf
    sed -i -e "s# /sbin/# ${sbindir}/#g" ${WORKDIR}/syslog
}

do_add_PATH () {
    sed -i -e "/export PATH/d;/^set -e/a export PATH=${bindir}:${sbindir}\${PATH:+:\$PATH}" ${WORKDIR}/syslog
}
