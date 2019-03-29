#!/bin/sh

source_dir=$1
installprefix=`pwd`/$source_dir/tmproot
app_dir=$installprefix/Emacs.app/Contents/Resources
emacs_version=$2
compver=x86_64-apple-darwin`uname -r`

export PATH="/usr/local/opt/texinfo/bin:$PATH"

set -e
cd $source_dir
./autogen.sh
./configure --with-mac --enable-mac-app=$installprefix --prefix=$installprefix 
make
make install
set +e

mv $installprefix/share/emacs/$emacs_version/* $app_dir
mv $installprefix/share/info $app_dir
mv $installprefix/share/man $app_dir
mv $installprefix/var $app_dir
mv $installprefix/bin $app_dir/../MacOS/bin
mv $installprefix/libexec/emacs/$emacs_version/$compver $app_dir/../MacOS/libexec
