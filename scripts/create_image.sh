#!/usr/bin/env bash
set -e

# Download and extract latest Trunk release
wget http://files.squeak.org/trunk/
build="$(grep -P -o '(?<=a href=")Squeak[^<>]*?-64bit(?=\/")' index.html | tail -1)"
buildAio="$build-All-in-One.zip"
wget "http://files.squeak.org/trunk/$build/$buildAio"
unzip -d allInOne/ "$buildAio" -x '*.mo'  # skip superfluous local files

export script_dir
script_dir="$(realpath "$(dirname "$0")")"
cd allInOne || exit 1
# Hack: Make squeak.sh capable of passing arguments to the image
sed -i '$s/$/ "$@"/' squeak.sh

# Prepare image (install repository)
# TODO: do we need to run VM headless?
./squeak.sh "$script_dir/prepareImage.st"

# Clean up caches
shopt -s globstar
rm -rf ./**/{{package,github}-cache/,\#tmp\#*}

# Write changes back to zip
zip -ur "$buildAio" .
