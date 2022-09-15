#!/bin/sh

source_dir=$1
installprefix=`pwd`/$source_dir/tmproot
emacs_version=$2

export PATH="/opt/homebrew/opt/texinfo/bin:/usr/local/opt/texinfo/bin:$PATH"

set -e
cd $source_dir
./autogen.sh
./configure --with-mac \
            --enable-locallisppath=/usr/local/share/emacs/site-lisp:/opt/homebrew/share/emacs/site-lisp \
            --enable-mac-app=$installprefix \
            --prefix=$installprefix \
            --enable-mac-self-contained \
            --with-modules \
            --with-xwidgets
make
make install
set +e
