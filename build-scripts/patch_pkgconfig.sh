#!/bin/sh

os_major_version=`sw_vers -productVersion | sed "s:.[[:digit:]]*.$::g"`
patch_path="${PWD}/pkgconfig_10.14.diff"

if [ $os_major_version == 10.14 ]; then
  echo "10.14, patch pkgconfig for homebrew; patch: $patch_path"
	cd $(brew --prefix)/Homebrew
	patch -p1 < $patch_path
fi
