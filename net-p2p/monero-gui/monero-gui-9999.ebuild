# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3
inherit eutils

DESCRIPTION="Monero Gui: the secure, private, untraceable cryptocurrency"
HOMEPAGE="https://getmonero.org/"

EGIT_REPO_URI="https://github.com/monero-project/monero-gui.git"

LICENSE="Monero"
SLOT="0"
DOCS=""
IUSE="qrcode daemon upnp unwind ldns lzma expat"

DEPEND="!daemon? ( net-p2p/monero )
daemon? ( !net-p2p/monero )
dev-libs/boost
dev-libs/openssl:0
net-libs/cppzmq
net-dns/unbound
dev-qt/qtcore:5
dev-qt/qtdeclarative:5
dev-qt/qtquickcontrols:5
dev-qt/qtquickcontrols2:5
dev-qt/qtgraphicaleffects:5
qrcode? (
dev-qt/qtmultimedia:5[qml]
media-gfx/zbar
)
upnp? ( net-libs/miniupnpc:0/16 )
unwind? ( sys-libs/libunwind )
ldns? ( net-libs/ldns )
lzma? ( app-arch/xz-utils )
expat? ( dev-libs/expat )"

RDEPEND="${DEPEND}"

BUILD_DIR="${S}/build/release"

src_unpack() {
	git-r3_src_unpack
}

src_compile() {
	QT_SELECT=5 ./build.sh
}

src_install() {
	dobin "${BUILD_DIR}/bin/monero-wallet-gui"
	use daemon && dobin "${BUILD_DIR}/bin/monerod"

	insinto "usr/share/${PN}/translations"
	for lang in ${BUILD_DIR}/bin/translations/*
	do
		doins "${lang}"
	done

	for icon in images/appicons/* ; do
		filename=${icon##*/}
		newicon -s ${filename/.png} ${icon} monero-wallet-gui.png
	done
	make_desktop_entry "monero-wallet-gui %u" "Monero Wallet" "monero-wallet-gui" "Network;P2P;Office;Finance;" "MimeType=x-scheme-handler/monero;\nTerminal=false"
}

pkg_postinst() {
	fdo-xdg_desktop_database_update
	xdg_mimeinfo_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	fdo-xdg_desktop_database_update
	xdg_mimeinfo_database_update
	gnome2_icon_cache_update
}
