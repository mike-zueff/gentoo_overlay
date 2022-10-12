# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PV=${PV^^}
MY_PV=${MY_PV/_/-}
inherit desktop qmake-utils

DESCRIPTION="Feature-rich dictionary lookup program"
HOMEPAGE="http://goldendict.org/"
SRC_URI="https://github.com/${PN}/${PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug ffmpeg "

RDEPEND="
	app-arch/bzip2
	>=app-text/hunspell-1.2:=
	dev-libs/eb
	dev-libs/lzo
	dev-qt/qtcore
	dev-qt/qtgui
	dev-qt/qthelp
	dev-qt/qtnetwork
	dev-qt/qtprintsupport
	dev-qt/qtsingleapplication[X]
	dev-qt/qtsvg:5
	dev-qt/qtwebkit
	dev-qt/qtwidgets
	dev-qt/qtx11extras
	dev-qt/qtxml
	media-libs/libvorbis
	media-libs/tiff
	sys-libs/zlib
	x11-libs/libX11
	x11-libs/libXtst
	ffmpeg? (
		media-libs/libao
		media-video/ffmpeg:=
	)
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-qt/linguist-tools
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}/${PN}-1.5.0-qtsingleapplication-unbundle.patch"
	"${FILESDIR}/${PN}-1.5.0-qt-5.11.patch"
	"${FILESDIR}/${PN}-1.5.0-ffmpeg-4.patch"
)

S="${WORKDIR}/${PN}-${MY_PV}"

src_prepare() {
	default

	# disable git
	sed -i \
		-e '/git describe/s/^/#/' \
		${PN}.pro || die

	# fix installation path
	sed -i \
		-e '/PREFIX = /s:/usr/local:/usr:' \
		${PN}.pro || die

	# add trailing semicolon
	sed -i -e '/^Categories/s/$/;/' redist/${PN}.desktop || die
}

src_configure() {
	local myconf=()
	use ffmpeg || myconf+=( DISABLE_INTERNAL_PLAYER=1 )

	eqmake5 "${myconf[@]}"
}

src_install() {
	dobin ${PN}
	domenu redist/${PN}.desktop
	doicon redist/icons/${PN}.png

	insinto /usr/share/apps/${PN}/locale
	doins locale/*.qm

	insinto /usr/share/${PN}/help
	doins help/*.qch
}
