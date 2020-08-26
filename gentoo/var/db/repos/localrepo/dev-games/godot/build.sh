#!/usr/bin/env bash
set -euo pipefail

CHOST="x86_64-pc-linux-gnu"
COMMON_FLAGS="-march=skylake -O2 -pipe"
CFLAGS="${COMMON_FLAGS}"
CXXFLAGS="${COMMON_FLAGS}"
FCFLAGS="${COMMON_FLAGS}"
FFLAGS="${COMMON_FLAGS}"
MAKEOPTS="-j8"

DEPS="net-libs/enet media-libs/opusfile net-libs/mbedtls net-libs/miniupnpc"

dep(){
    sudo emerge	$DEPS
}

p1(){
# https://docs.godotengine.org/en/stable/development/compiling/compiling_with_mono.html#generate-the-glue
scons -j8 \
		builtin_enet=no   \
		builtin_freetype=no   \
		builtin_libogg=no   \
		builtin_libpng=no   \
		builtin_libtheora=no   \
		builtin_libvorbis=no   \
		builtin_libvpx=no   \
		builtin_libwebp=no   \
		builtin_mbedtls=no   \
		builtin_miniupnpc=no   \
		builtin_opus=no   \
		builtin_pcre2=no   \
		builtin_zlib=no   \
		builtin_zstd=no   \
		module_enet_enabled=yes   \
		module_freetype_enabled=yes   \
		module_mbedtls_enabled=yes   \
		module_opus_enabled=yes   \
		module_theora_enabled=yes   \
		module_vorbis_enabled=yes   \
		module_webp_enabled=yes   \
		module_mono_enabled=yes   \
		platform=x11   \
		progress=yes   \
		tools=yes   \
		mono_glue=no   \
		pulseaudio=yes   \
		udev=yes target=release_debug || exit 1

bin/godot.x11.opt.tools.64.mono --generate-mono-glue modules/mono/glue || exit 1
}

p2(){
#patch -p1 < $(dirname $0)/files/GodotTools.BuildLogger.patch || exit 1

scons -j8 \
		builtin_enet=no   \
		builtin_freetype=no   \
		builtin_libogg=no   \
		builtin_libpng=no   \
		builtin_libtheora=no   \
		builtin_libvorbis=no   \
		builtin_libvpx=no   \
		builtin_libwebp=no   \
		builtin_mbedtls=no   \
		builtin_miniupnpc=no   \
		builtin_opus=no   \
		builtin_pcre2=no   \
		builtin_zlib=no   \
		builtin_zstd=no   \
		module_enet_enabled=yes   \
		module_freetype_enabled=yes   \
		module_mbedtls_enabled=yes   \
		module_opus_enabled=yes   \
		module_theora_enabled=yes   \
		module_vorbis_enabled=yes   \
		module_webp_enabled=yes   \
		module_mono_enabled=yes   \
		platform=x11   \
		progress=yes   \
		tools=yes   \
		mono_glue=yes   \
		pulseaudio=yes   \
		udev=yes target=release_debug || exit 1

strip bin/godot.x11.opt.tools.64.mono
}

x11(){
echo Building X11 template
scons -j8 \
		builtin_enet=no   \
		builtin_freetype=no   \
		builtin_libogg=no   \
		builtin_libpng=no   \
		builtin_libtheora=no   \
		builtin_libvorbis=no   \
		builtin_libvpx=no   \
		builtin_libwebp=no   \
		builtin_mbedtls=no   \
		builtin_miniupnpc=no   \
		builtin_opus=no   \
		builtin_pcre2=no   \
		builtin_zlib=no   \
		builtin_zstd=no   \
		module_enet_enabled=yes   \
		module_freetype_enabled=yes   \
		module_mbedtls_enabled=yes   \
		module_opus_enabled=yes   \
		module_theora_enabled=yes   \
		module_vorbis_enabled=yes   \
		module_webp_enabled=yes   \
		module_mono_enabled=yes   \
		platform=x11   \
		progress=yes   \
		tools=no   \
		pulseaudio=yes   \
		udev=yes target=release || exit 1
}

cleanup(){
	echo clean up
}

#deps
#p1
p2
x11
