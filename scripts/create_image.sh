#!/usr/bin/env bash
set -e

# Download and extract latest Trunk release
wget http://files.squeak.org/trunk/
build="$(grep -P -o '(?<=a href=")Squeak[^<>]*?-64bit(?=\/")' index.html | tail -1)"
buildAio="$build-All-in-One.zip"
wget "http://files.squeak.org/trunk/$build/$buildAio"
unzip -d allInOne/ "$buildAio" -x '*.mo'  # skip superfluous local files

# Prepare VM execution
export script_dir
script_dir="$(realpath "$(dirname "$0")")"
cd allInOne || exit 1
# HACK: Modify squeak.sh because arguments are currently not available for the All-in-One bundles
# See: https://github.com/squeak-smalltalk/squeak-app/pull/17#issuecomment-876753284
# Make squeak.sh capable of passing arguments to the image
sed -i '$s/$/ "$@"/' squeak.sh
if [[ "$CI" == true ]]; then
	# Add -headless flag to the VM configuration
	# shellcheck disable=SC2016
	sed -ie 's/\(exec "${VM}"\)\( "${IMAGE}"\)/\1 -headless\2/' squeak.sh
fi

# Prepare image (install repository)
./squeak.sh "$script_dir/prepareImage.st"

# Clean up caches
shopt -s globstar
rm -rf ./**/{{package,github}-cache/,\#tmp\#*}

# Write changes back to zip
zip -u -r "../$buildAio" .
