# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=(python2_7)

inherit distutils-r1 git-r3

DESCRIPTION="Linux screen capture using PyGTK, inspired by scrot"
EGIT_REPO_URI="git://github.com/Roger/escrotum.git"
HOMEPAGE="https://github.com/Roger/escrotum"
KEYWORDS="~amd64"
LICENSE="GPL-3"
RDEPEND="dev-python/pygtk:2[${PYTHON_USEDEP}]"
SLOT="0"
