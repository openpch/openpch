DEPENDS = "gnutls openssl libtool intltool-native curl glib-2.0-native libevent"

SRC_URI += "\
        file://configure-kill-intl-check.patch \
        file://configure-allow-local-network.patch \
        file://configuration-default-download-dir.patch \
        "

OE_EXTRACONF = "\
        --disable-gtk --without-gtk \
        --disable-nls --without-nls \
        --disable-mac \
        --disable-wx \
        --disable-beos \
        --enable-lightweight \
        --enable-cli \
        --enable-daemon \
        CPPFLAGS=-DTR_EMBEDDED \
        "
