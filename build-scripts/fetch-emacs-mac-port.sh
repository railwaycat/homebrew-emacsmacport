#!/bin/sh

set -e

MACPORT_VAR="$1"
COMMIT_HASH="$2"
OUTPUT_DIR="$3"

MULTI_TTY_PATCH=emacs-mac-29-multi-tty.diff
echo "fetch tarball"
if [ "$1" = "head" ]; then
  git clone --depth=1 --branch=work https://bitbucket.org/mituharu/emacs-mac.git "$OUTPUT_DIR"
  MULTI_TTY_PATCH=emacs-mac-29.2-rc-1-multi-tty.diff
else
  curl -L "https://bitbucket.org/mituharu/emacs-mac/get/$COMMIT_HASH.tar.gz" -o "emacs-$MACPORT_VAR.tar.gz"
  mkdir "$OUTPUT_DIR"
  tar xf "emacs-$MACPORT_VAR.tar.gz" -C "./$OUTPUT_DIR" --strip-components=1
fi

echo "apply patch: --with-natural-title-bar"
patch -d "$OUTPUT_DIR" -p1 < ../patches/emacs-mac-title-bar-9.1.diff

echo "apply patch: multi-tty"
patch -d "$OUTPUT_DIR" -p1 < ../patches/${MULTI_TTY_PATCH}

echo "apply patch: bundle structure signature hack"
# this is a hack to let pdump be installed under Contents/MacOS and libexec
# under Contents/MacOS/libexec. To avoid an error on bundle structure when
# signing.
patch -d "$OUTPUT_DIR" -p1 < ../patches/bundle-signature-hack-9.0.diff
