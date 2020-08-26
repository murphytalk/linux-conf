# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# See https://dist.nuget.org/index.json for available versions
# This version is required by Godot-mono

DESCRIPTION="Nuget - .NET Package Manager"
HOMEPAGE="https://www.nuget.org/"
SRC_URI="https://dist.nuget.org/win-x86-commandline/v${PV}/nuget.exe -> ${P}.exe"

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
	# nuget is not packed, we only generate the shell wrapper to launch nuget.exe
	cat <<EOF > $WORKDIR/${PN}
#!/bin/sh
exec /usr/bin/mono /usr/share/nuget/nuget.exe "\$@"
EOF
}

src_install() {
	exeinto "/usr/bin"
	doexe "$WORKDIR/${PN}"
	insinto "/usr/share/${PN}"
	newins "${DISTDIR}/${P}.exe" "nuget.exe"
}
