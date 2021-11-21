#!/bin/sh

set -e

if [ "$1" = "head" ]; then
  git clone --depth=1 --branch=work https://bitbucket.org/mituharu/emacs-mac.git emacs-source
else
  curl -O -L https://bitbucket.org/mituharu/emacs-mac/get/emacs-$1.tar.gz
  mkdir emacs-source
  tar xf emacs-$1.tar.gz -C ./emacs-source --strip-components=1
fi

# apply patch: emacs-mac-title-bar-7.4.patch
patch -d emacs-source -p1 < ../patches/emacs-mac-title-bar-7.4.patch

# apply patch: multi-tty-27.diff
patch -d emacs-source -p1 < ../patches/multi-tty-27.diff

# Emacs 27 will need this patch for mac builds, later version should be fixed
if [ "$(uname -p)" = "arm" ]; then
  patch -d emacs-source -p1 < ../patches/mac-arm-fix.diff
fi
