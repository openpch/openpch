# Add this dir to replace runlevel with a fake version
FILESEXTRAPATHS_prepend := "${THISDIR}:"

SRC_URI += " \
            file://runlevel.fake \
"

# Remove binaries that doesn't work on PCH devices

ALTERNATIVE_${PN}_remove = "halt"
ALTERNATIVE_${PN}_remove = "reboot"
ALTERNATIVE_${PN}_remove = "shutdown"
ALTERNATIVE_${PN}_remove = "poweroff"

do_install_append () {
    rm -f \
        "${D}${base_sbindir}/halt"     \
        "${D}${base_sbindir}/reboot"   \
        "${D}${base_sbindir}/shutdown" \
        "${D}${base_sbindir}/poweroff"

    rm -f \
        "${D}${mandir}/man8/halt.8"     \
        "${D}${mandir}/man8/reboot.8"   \
        "${D}${mandir}/man8/shutdown.8" \
        "${D}${mandir}/man8/poweroff.8"

    # Replace runlevel with a fake version
    install -m 0755 ${WORKDIR}/runlevel.fake "${D}${base_sbindir}/runlevel"
}
