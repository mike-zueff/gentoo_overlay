# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit qt5-build

unset EGIT_BRANCH

DEPEND="dev-qt/qtcore:5"
DESCRIPTION="GTK+ style plugins for Qt"
HOMEPAGE="https://code.qt.io/cgit/qt/qtstyleplugins"

post_src_install() {
  insinto /etc/profile.d
  doins "${FILESDIR}/qtstyleplugins.sh"
}
