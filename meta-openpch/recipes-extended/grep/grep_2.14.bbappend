# Check that bindir is different than base_bindir
do_install () {
    autotools_do_install
    install -d ${D}${base_bindir}
    if [ "${bindir}" != "${base_bindir}" ]; then
        mv ${D}${bindir}/grep ${D}${base_bindir}/grep
        mv ${D}${bindir}/egrep ${D}${base_bindir}/egrep
        mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep
        rmdir ${D}${bindir}/
    fi
}
