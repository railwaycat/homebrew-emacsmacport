#!/bin/sh

set -e

OUTPUT_DIR="$1"
MACPORT_VAR="29.4-mac-10.1"
COMMIT_HASH="5a9b8b89ddf75f6f7c5e584e82d021bfa7383805"

echo "fetch tarball"
curl -L "https://bitbucket.org/mituharu/emacs-mac/get/$COMMIT_HASH.tar.gz" -o "emacs-$MACPORT_VAR.tar.gz"
mkdir "$OUTPUT_DIR"
tar xf "emacs-$MACPORT_VAR.tar.gz" -C "./$OUTPUT_DIR" --strip-components=1

echo "apply patch: --with-natural-title-bar"
patch -d "$OUTPUT_DIR" -p1 < ../patches/emacs-mac-title-bar-9.1.diff

echo "apply patch: multi-tty"
patch -d "$OUTPUT_DIR" -p1 < ../patches/emacs-mac-29.2-rc-1-multi-tty.diff

echo "apply patch: prefer-typo-ascender-descender-linegap"
patch -d "$OUTPUT_DIR" -p1 < ../patches/prefer-typo-ascender-descender-linegap.diff

echo "apply patch: bundle structure signature hack"
# this is a hack to let pdump be installed under Contents/MacOS and libexec
# under Contents/MacOS/libexec. To avoid an error on bundle structure when
# signing.
patch -d "$OUTPUT_DIR" -p1 < ../patches/bundle-signature-hack-9.0.diff
