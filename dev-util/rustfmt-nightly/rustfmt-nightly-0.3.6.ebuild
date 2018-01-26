# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CRATES="
cargo_metadata-0.4.0
derive-new-0.5.0
diff-0.1.0
env_logger-0.4.0
getopts-0.2.0
kernel32-sys-0.2.2
libc-0.2.11
log-0.3.0
regex-0.2.0
rustc-ap-rustc_errors-12.0.0
rustc-ap-syntax-12.0.0
rustfmt-nightly-0.3.6
serde-1.0.0
serde_derive-1.0.0
serde_json-1.0.0
term-0.4.0
toml-0.4.0
unicode-segmentation-1.0.0
winapi-0.2.7
"

inherit cargo

DESCRIPTION="Tool to find and fix Rust formatting issues"
HOMEPAGE="https://github.com/rust-lang-nursery/rustfmt"
SRC_URI="$(cargo_crate_uris ${CRATES})"
LICENSE="|| ( MIT Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/rust-1.8.0"
RDEPEND=""
