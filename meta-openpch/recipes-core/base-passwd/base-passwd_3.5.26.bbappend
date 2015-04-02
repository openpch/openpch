FILESEXTRAPATHS_prepend := "${THISDIR}:"

SRC_URI += " \
            file://passwd.pch \
            file://group.pch  \
"

# Fix the path of the etc and share directories
do_patch_append() {
    bb.build.exec_func('do_fix_paths', d)
    bb.build.exec_func('do_replace_master_files', d)
}

do_fix_paths () {
    sed -i -e "s#\"/etc/#\"${base_prefix}/etc/#g" ${S}/update-passwd.c
    sed -i -e "s#\"/usr/share/#\"${datadir}/#g" ${S}/update-passwd.c
    sed -i -e "s#_PATH_SHADOW#\"${base_prefix}/etc/shadow\"#g" ${S}/update-passwd.c
}

do_replace_master_files () {
    cp -f ${WORKDIR}/passwd.pch ${S}/passwd.master
    cp -f ${WORKDIR}/group.pch  ${S}/group.master
}

base_passwd_sstate_postinst_append() {
	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
	then
	    # Target sysroot, don't have /etc directory so we 
	    # link the /etc/passwd and /etc/group file manually
	    # to the ${syscondif}. Then the files can be used
	    # by recipes which use custom user/group permissions.
	    install -d -m 755 ${STAGING_DIR_TARGET}/etc
	    ln -sf ${STAGING_DIR_TARGET}${sysconfdir}/passwd ${STAGING_DIR_TARGET}/etc/passwd
	    ln -sf ${STAGING_DIR_TARGET}${sysconfdir}/group ${STAGING_DIR_TARGET}/etc/group
	fi
}
