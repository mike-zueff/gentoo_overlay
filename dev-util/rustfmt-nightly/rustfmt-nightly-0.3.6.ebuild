# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CRATES="
aho-corasick-0.6.4
backtrace-0.3.5
backtrace-sys-0.1.16
bitflags-1.0.1
cargo_metadata-0.4.0
cargo_metadata-0.4.1
cc-1.0.4
cfg-if-0.1.2
derive-new-0.5.0
diff-0.1.0
diff-0.1.11
dtoa-0.4.2
env_logger-0.4.0
env_logger-0.4.3
error-chain-0.11.0
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
getopts-0.2.0
getopts-0.2.15
itoa-0.3.4
kernel32-sys-0.2.2
lazy_static-1.0.0
libc-0.2.11
libc-0.2.36
log-0.3.0
log-0.3.9
log-0.4.1
memchr-2.0.1
num-traits-0.1.41
owning_ref-0.3.3
parking_lot-0.5.3
parking_lot_core-0.2.10
quote-0.3.15
rand-0.3.20
regex-0.2.0
regex-0.2.5
regex-syntax-0.4.2
rustc-ap-rustc_cratesio_shim-12.0.0
rustc-ap-rustc_data_structures-12.0.0
rustc-ap-rustc_errors-12.0.0
rustc-ap-serialize-12.0.0
rustc-ap-syntax-12.0.0
rustc-ap-syntax_pos-12.0.0
rustc-demangle-0.1.5
rustfmt-nightly-0.3.6
semver-0.8.0
semver-parser-0.7.0
serde-1.0.0
serde-1.0.27
serde_derive-1.0.0
serde_derive-1.0.27
serde_derive_internals-0.19.0
serde_json-1.0.0
serde_json-1.0.9
smallvec-0.6.0
stable_deref_trait-1.0.0
syn-0.11.11
synom-0.11.3
term-0.4.0
term-0.4.6
thread_local-0.3.5
toml-0.4.0
toml-0.4.5
unicode-segmentation-1.0.0
unicode-segmentation-1.2.0
unicode-width-0.1.4
unicode-xid-0.0.4
unreachable-1.0.0
utf8-ranges-1.0.0
void-1.0.2
winapi-0.2.7
winapi-0.2.8
winapi-0.3.4
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
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
