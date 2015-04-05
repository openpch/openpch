# Add path to the ca-certs bundle include in the ca-certificates package

EXTRA_OECONF += "--with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt"

RRECOMMENDS_lib${BPN} += "ca-certificates"
RRECOMMENDS_lib${BPN}_remove = "${PN}-certs"
