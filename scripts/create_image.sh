#!/usr/bin/env bash
set -e

# Download and extract latest Trunk release
files_server="http://files.squeak.org/trunk"
files_index="files.html"
wget -O "$files_index" "$files_server"
build="$(grep -P -o '(?<=a href=")Squeak[^<>]*?-64bit(?=\/")' "$files_index" | tail -1)"
buildAio="$build-All-in-One.zip"
wget "$files_server/$build/$buildAio"
unzip -d allInOne/ "$buildAio" -x '*.mo'  # skip superfluous local files (optimization)

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
