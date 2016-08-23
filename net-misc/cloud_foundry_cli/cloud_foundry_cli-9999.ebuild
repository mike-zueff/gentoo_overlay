# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit golang-build golang-vcs

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"

DESCRIPTION="A command-line tool to interact with Cloud Foundry"
EGO_PN="github.com/cloudfoundry/cli"
HOMEPAGE="https://github.com/cloudfoundry/cli"
LICENSE="Apache-2.0"
SLOT="0"

pre_pkg_preinst() {
	exeinto /opt/bin
	newexe "${S}/cli" cf
}
