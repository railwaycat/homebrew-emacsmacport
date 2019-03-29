#!/bin/sh

set -e

if [ "$1" = "head" ]; then
  git clone --depth=1 --branch=work https://bitbucket.org/mituharu/emacs-mac.git emacs-head
else
  curl -O -L https://bitbucket.org/mituharu/emacs-mac/get/emacs-$1.tar.gz
  mkdir emacs-source
  tar xf emacs-$1.tar.gz -C ./emacs-source --strip-components=1
fi
