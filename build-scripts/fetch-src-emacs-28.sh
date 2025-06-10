#!/bin/sh

set -e

OUTPUT_DIR="$1"
MACPORT_VAR="28.3-rc1-mac-9.2"
COMMIT_HASH="25008e087de5e784605a7fe0b445af0cbfa6bfc4"

echo "fetch tarball"
curl -L "https://bitbucket.org/mituharu/emacs-mac/get/$COMMIT_HASH.tar.gz" -o "emacs-$MACPORT_VAR.tar.gz"
mkdir "$OUTPUT_DIR"
tar xf "emacs-$MACPORT_VAR.tar.gz" -C "./$OUTPUT_DIR" --strip-components=1

echo "apply patch: --with-natural-title-bar"
patch -d "$OUTPUT_DIR" -p1 < ../patches/emacs-mac-title-bar-9.1.diff

echo "apply patch: multi-tty"
patch -d "$OUTPUT_DIR" -p1 < ../patches/emacs-mac-28.3-rc-1-multi-tty-27.diff

echo "apply patch: prefer-typo-ascender-descender-linegap"
patch -d "$OUTPUT_DIR" -p1 < ../patches/prefer-typo-ascender-descender-linegap.diff

echo "apply patch: bundle structure signature hack"
# this is a hack to let pdump be installed under Contents/MacOS and libexec
# under Contents/MacOS/libexec. To avoid an error on bundle structure when
# signing.
patch -d "$OUTPUT_DIR" -p1 < ../patches/bundle-signature-hack-9.0.diff
