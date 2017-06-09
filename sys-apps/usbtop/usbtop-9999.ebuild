# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_REPO_URI="https://github.com/aguinet/usbtop.git"

inherit cmake-utils git-r3

DESCRIPTION="A top-like utility that shows an estimated instantaneous bandwidth on USB buses and devices"
HOMEPAGE="https://github.com/aguinet/usbtop"
LICENSE="BSD"
SLOT="0"

DEPEND="dev-libs/boost[threads]
        dev-util/cmake
        net-libs/libpcap[usb]"

RDEPEND="${DEPEND}"
