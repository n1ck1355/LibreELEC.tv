################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="RTL8812AU"
PKG_VERSION="af07b27"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/paspro/rtl8812au"
PKG_URL="https://github.com/paspro/rtl8812au/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="rtl8812au-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="driver"
PKG_SHORTDESC="Realtek RTL8812AU Linux 3.x driver"
PKG_LONGDESC="Realtek RTL8812AU Linux 3.x driver"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  kernel_make V=1 \
       KSRC=$(kernel_path) \
       CONFIG_POWER_SAVING=n
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/modules/$(get_module_dir)/$PKG_NAME
    cp *.ko $INSTALL/usr/lib/modules/$(get_module_dir)/$PKG_NAME
}
