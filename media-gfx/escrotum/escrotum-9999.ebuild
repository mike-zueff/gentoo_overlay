# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

EGIT_REPO_URI="https://github.com/Roger/escrotum.git"
PYTHON_COMPAT=(python2_7 python3_{6,7,8})

inherit distutils-r1 git-r3

DEPEND="dev-python/xcffib"
DESCRIPTION="Linux screen capture using pygtk inspired by scrot"
HOMEPAGE="https://github.com/Roger/escrotum"
SLOT="0"
