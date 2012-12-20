# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="A C library that provides a simple interface to read whole-slide images, aka virtual slides."
HOMEPAGE="http://openslide.org/"
SRC_URI="http://download.openslide.org/releases/${PN}/${P}.tar.gz"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="LGPL-2.1"
RESTRICT="mirror"

IUSE="doc"
DEPEND="virtual/jpeg
        media-libs/openjpeg
        media-libs/tiff
        >=x11-libs/cairo-1.2
        >=dev-libs/glib-2.12"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die
	find "${D}" -name "*.la" -delete
	use doc && dohtml -r "${S}/doc/html/"
}

