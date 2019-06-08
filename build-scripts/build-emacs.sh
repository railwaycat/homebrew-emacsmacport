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
./configure --with-mac --enable-mac-app=$installprefix --prefix=$installprefix --enable-self-contained
make
make install
set +e