#!/bin/sh

set -e

echo "fetch tarball"
if [ "$1" = "head" ]; then
  git clone --depth=1 --branch=work https://bitbucket.org/mituharu/emacs-mac.git emacs-source
else
  curl -O -L https://bitbucket.org/mituharu/emacs-mac/get/emacs-$1.tar.gz
  mkdir emacs-source
  tar xf emacs-$1.tar.gz -C ./emacs-source --strip-components=1
fi

echo "apply patch: --with-natural-title-bar"
patch -d emacs-source -p1 < ../patches/emacs-mac-title-bar-9.0.patch

echo "apply patch: multi-tty-27"
patch -d emacs-source -p1 < ../patches/multi-tty-27.diff

echo "apply patch: bundle structure signature hack"
# this is a hack to let pdump be installed under Contents/MacOS and libexec
# under Contents/MacOS/libexec. To avoid an error on bundle structure when
# signing.
patch -d emacs-source -p1 < ../patches/bundle-signature-hack-9.0.diff
