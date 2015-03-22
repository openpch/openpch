do_patch_append() {
    bb.build.exec_func('do_fix_etc', d)
}

do_fix_etc () {
    sed -i -e "s#/etc/#${sysconfdir}/#g" ${S}/update-rc.d
}
