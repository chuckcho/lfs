#!/bin/bash
set -e
echo "Continue with chroot environment.."

# SKIP remove the "I have no name!" promp
# exec /tools/bin/bash --login +h

# build toolchain
for f in /tools/6.*.sh; do
  if [[ $f == *"6.02"* ]]; then
    continue
  fi
  sh "$f"
done

exit
