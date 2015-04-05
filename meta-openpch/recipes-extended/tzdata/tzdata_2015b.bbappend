# Fix installation of timezones files

do_install_prepend () {
    install -d ${D}${datadir}
    cp -pPR ${S}${datadir}/zoneinfo ${D}${datadir}/
}

do_install_append () {
    rm -rf ${D}/$(basename "${S}${exec_prefix}")
}
