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
}
