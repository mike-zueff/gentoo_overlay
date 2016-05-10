# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit bash-completion-r1 eutils git-r3

DEPEND="dev-lang/rust
	dev-libs/openssl:*
	dev-util/cmake
	net-libs/http-parser
	net-libs/libssh2
	net-misc/curl[ssl]
	sys-libs/zlib"

DESCRIPTION="Rust package manager"
EGIT_REPO_URI="git://github.com/rust-lang/cargo.git"
HOMEPAGE="https://crates.io/"
LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"

src_compile() {
	emake PKG_CONFIG_PATH="" VERBOSE="1" || die
}

src_configure() {
	./configure --disable-verify-install --prefix="${EPREFIX}/usr" || die
}

src_install() {
	CFG_DISABLE_LDCONFIG="true" emake DESTDIR="${D}" install || die
	dobashcomp "${ED}/usr/etc/bash_completion.d/cargo"
	rm --force --recursive "${ED}/usr/etc"
}
