#!/bin/bash
set -e
echo "Downloading toolchain.."

pushd $LFS/sources

case "$FETCH_TOOLCHAIN_MODE" in
  "0")
    echo "Downloading LFS packages.."
    echo "Getting wget-list.."
    wget --timestamping http://www.linuxfromscratch.org/lfs/view/8.3/wget-list

    echo "Getting packages.."
    wget --timestamping --continue --input-file=wget-list

    echo "Getting md5.."
    wget --timestamping http://www.linuxfromscratch.org/lfs/downloads/8.3/md5sums

    echo "Check hashes.."
    md5sum -c md5sums

    echo "Downloading syslinux package.."
    wget --timestamping https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.xz
    echo "Check hash.."
    echo "26d3986d2bea109d5dc0e4f8c4822a459276cf021125e8c9f23c3cca5d8c850e $LFS/sources/syslinux-6.03.tar.xz" | sha256sum -c -
    ;;
  "1")
    echo "Assume toolchain from host is already placed in sources folder"
    ;;
  "2")
    # TODO(chuck): get the release ready
    wget --timestamping https://github.com/ccho/lfs/releases/download/v8.3.0/toolchain.tar.gz
    tar -xvf toolchain.tar.gz
    rm toolchain.tar.gz
    ;;
  *)
    echo "Undefined way to get toolchain!"
    false
    ;;
esac

popd
