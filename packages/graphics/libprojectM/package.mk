# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libprojectM"
PKG_VERSION="v3.1.1-rc7"
PKG_SHA256="97ca3837c889bcef9df8239de831b0db9d01b3e14a6301827d126fdfc660bf71"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/projectM-visualizer/projectm"
PKG_URL="https://github.com/projectM-visualizer/projectm/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain freetype glm $OPENGL"
PKG_LONGDESC="A MilkDrop compatible opensource music visualizer."
PKG_TOOLCHAIN="configure"
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared \
                           --enable-static \
                           --disable-qt \
                           --disable-pulseaudio \
                           --disable-jack \
                           --prefix=${OUTPUT_DIR} \
                           --with-pic ${PROJECTM_CONFIG} \
                           --enable-preset-subdirs"

# workaround due broken release files, remove at next bump
pre_configure_target() {
  ./autogen.sh
}
