# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit unpacker
DESCRIPTION="MSBUILD - .NET Build System"
HOMEPAGE="https://download.mono-project.com/repo/ubuntu/pool/main/m/msbuild/"
SRC_URI="https://download.mono-project.com/repo/ubuntu/pool/main/m/msbuild/msbuild_16.6+xamarinxplat.2020.04.29.14.43-0xamarin5+ubuntu2004b1_all.deb -> ${P}.deb"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S="${WORKDIR}"

RDEPEND=">=dev-lang/mono-6.6.0.161"

src_compile() { :; }

#https://devmanual.gentoo.org/ebuild-writing/functions/src_unpack/index.html
#https://devmanual.gentoo.org/ebuild-writing/variables/index.html#ebuild-defined-variables
src_unpack() {
	unpack_deb ${P}.deb
}

src_install() {
	insinto "/usr/lib/mono/msbuild"
	doins -r "$WORKDIR/usr/lib/mono/msbuild/Current"
	doins "$WORKDIR/usr/lib/mono/msbuild/15.0"
	dobin "$WORKDIR/usr/bin/msbuild"
}
