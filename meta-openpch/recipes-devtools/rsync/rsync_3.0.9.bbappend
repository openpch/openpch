
# Move files install in /etc instead of ${sysconfdir}
do_install_append() {
        mv ${D}/etc ${D}${sysconfdir}
}
