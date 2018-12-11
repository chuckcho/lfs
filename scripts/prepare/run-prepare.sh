#!/bin/bash
set -e
echo "Preparing environment.."

# download toolchain
sh /tools/3.01-download-tools.sh

# build toolchain (all scripts starting with "5.")
for script in /tools/5.*.sh; do
  sh "${script}"
done
