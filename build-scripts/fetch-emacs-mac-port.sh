#!/bin/sh

set -e

if [ "$1" = "head" ]; then
  git clone --depth=1 --branch=work https://bitbucket.org/mituharu/emacs-mac.git emacs-source
else
  curl -O -L https://bitbucket.org/mituharu/emacs-mac/get/emacs-$1.tar.gz
  mkdir emacs-source
  tar xf emacs-$1.tar.gz -C ./emacs-source --strip-components=1
fi

# apply the self-contained patch
# this patch will no longer be needed once this pull request merged
# https://bitbucket.org/mituharu/emacs-mac/pull-requests/4/add-self-contained-build-option/diff
patch -d emacs-source -p1 < self-contained.diff