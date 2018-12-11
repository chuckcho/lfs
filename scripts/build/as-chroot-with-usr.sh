#!/bin/bash
set -e
echo "Continue with chroot environment.."

# configure system
for f in /tools/7.*.sh; do
  sh "$f"
done

# make system bootable
for f in /tools/8.*.sh; do
  sh "$f"
done

# end
sh /tools/9.01-the-end.sh

exit
