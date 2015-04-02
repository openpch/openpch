FILESEXTRAPATHS_prepend := "${THISDIR}:"

# Fix the path of the etc and share directories
do_patch_append() {
    bb.build.exec_func('do_fix_paths', d)
}

do_fix_paths () {
   sed -i \
        -e 's|#SYSCONFDIR#|${sysconfdir}|g'       \
        -e 's|#SBINDIR#|${sbindir}|g'             \
        -e 's|#LOCALSTATEDIR#|${localstatedir}|g' \
        ${WORKDIR}/init
}

# Install and remove some dirs so the original bb file can be used
do_install_prepend () {
   install -d ${D}${localstatedir}/run/sshd
}
do_install_append () {
   rmdir ${D}/var/run/sshd ${D}/var/run ${D}/var
}
