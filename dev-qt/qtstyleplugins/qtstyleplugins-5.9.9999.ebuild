# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qt5-build

unset EGIT_BRANCH

DEPEND="dev-qt/qtcore:5
	x11-themes/gtk-engines-murrine"
DESCRIPTION="GTK+ style plugins for Qt"
HOMEPAGE="https://code.qt.io/cgit/qt/qtstyleplugins"

PATCHES=(
	"${FILESDIR}"/0001-fix-build-against-Qt-5.15.patch
	"${FILESDIR}"/0002-fix-gtk2-background.patch
)

post_src_install() {
  insinto /etc/profile.d
  doins "${FILESDIR}/qtstyleplugins.sh"
}
