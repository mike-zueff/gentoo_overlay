# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="GTK+2.0 integration plugins for Qt6"
HOMEPAGE="https://www.opencode.net/trialuser/qt6gtk2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

SRC_URI="https://www.opencode.net/trialuser/qt6gtk2/-/archive/${PV}/${P}-${PV}.tar.gz"

RDEPEND="dev-qt/qtbase:6=
	x11-libs/gtk+:2
	x11-libs/libX11"
DEPEND="${RDEPEND}"

src_configure() {
	mkdir -p "${S}/build" || die
	"${EPREFIX}/usr/$(get_libdir)/qt6/bin/qmake" PREFIX="${ED}/usr" || die "Qt6 qmake failed!"
	default
}

src_install() {
	emake INSTALL_ROOT="${ED}" install
}
