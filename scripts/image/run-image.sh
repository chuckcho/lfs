#!/bin/bash
set -e
echo "Start building bootable image.."

pushd /tmp
mkdir isolinux

sh /tools/postbuild-1.configure-syslinux.sh
sh /tools/postbuild-2.create-ramdisk.sh
sh /tools/postbuild-3.build-iso.sh

rm -rf isolinux
popd
