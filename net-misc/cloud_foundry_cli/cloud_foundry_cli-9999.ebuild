# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit golang-build golang-vcs

DESCRIPTION="A command-line tool to interact with Cloud Foundry"
EGO_PN="github.com/cloudfoundry/cli"
HOMEPAGE="https://github.com/cloudfoundry/cli"
LICENSE="Apache-2.0"
SLOT="0"

post_src_compile() {
	mv --force cli clee123123
}

pre_pkg_preinst() {
	exeinto /opt/bin
	doexe clee123123
}
