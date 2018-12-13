#!/bin/bash
set -e
echo "Building tar.."
echo "Approximate build time: 0.4 SBU"
echo "Required disk space: 36 MB"

# 5.32. Tar package contains an archiving program
tar -xf tar-*.tar.xz -C /tmp/ \
 && mv /tmp/tar-* /tmp/tar \
 && pushd /tmp/tar \
 && ./configure --prefix=/tools \
 && make \
 && if [ $LFS_TEST -eq 1 ]; then make check; fi \
 && make install \
 && popd \
 && rm -rf /tmp/tar || true
