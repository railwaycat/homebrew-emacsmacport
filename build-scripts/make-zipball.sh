#!/bin/sh

set -e

work_dir=$1
emacs_version=$2
version="$emacs_version-$(uname -m)-$(sw_vers -productVersion)"
echo "make tarball for version $version"

# default icon
cd $work_dir
ditto -c -k --sequesterRsrc --keepParent Emacs.app "emacs-$version.zip"
echo "done with emacs-$version.zip"

# spacemacs icon
icon_dir="Emacs.app/Contents/Resources/Emacs.icns"
rm $icon_dir
curl -L "https://github.com/railwaycat/homebrew-emacsmacport/raw/1f15aa8809e96e996dde805055d6faca2088930c/icons/spacemacs-icon.icns" -o $icon_dir
ditto -c -k --sequesterRsrc --keepParent Emacs.app "emacs-$version-spacemacs-icon.zip"
shasum -a 256 emacs-*.zip
echo "done with emacs-$version-spacemacs-icon.zip"
