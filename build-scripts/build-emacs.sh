#!/bin/sh

source_dir=$1
installprefix=`pwd`/$source_dir/tmproot

# texinfo usually a keg-only package
export PATH="/opt/homebrew/opt/texinfo/bin:/usr/local/opt/texinfo/bin:$PATH"

# only use when on a separated homebrew
# BREW_DIR="$HOME/homebrew"
# eval "$($BREW_DIR/bin/brew shellenv)"

set -e
cd $source_dir
./autogen.sh
# use `--without-xx` here to prevent pollution from CI image
# preinstalled libs.
./configure \
  --with-mac \
  --enable-locallisppath=/usr/local/share/emacs/site-lisp:/opt/homebrew/share/emacs/site-lisp \
  --enable-mac-app=$installprefix \
  --prefix=$installprefix \
  --enable-mac-self-contained \
  --with-modules \
  --with-xwidgets \
  --with-tree-sitter \
  --without-lcms2 \
  --without-webp
make
make install
set +e
