#!/bin/sh

set -e

OUTPUT_DIR="$1"

echo "fetch source code from latest HEAD"
git clone \
  --depth 1 \
  --single-branch \
  --branch "emacs-mac-30_1_exp" \
  "https://github.com/jdtsmith/emacs-mac.git" \
  "$OUTPUT_DIR"

echo "apply patch: multi-tty"
patch -d "$OUTPUT_DIR" -p1 < ../patches/emacs-mac-29.2-rc-1-multi-tty.diff

echo "apply patch: Make man more portable"
patch -d "$OUTPUT_DIR" -p1 < ../patches/emacs-mac-30-Make-man-more-portable.diff

echo "apply patch: --with-natural-title-bar"
patch -d "$OUTPUT_DIR" -p1 < ../patches/emacs-mac-title-bar-9.1.diff

echo "apply patch: prefer-typo-ascender-descender-linegap"
patch -d "$OUTPUT_DIR" -p1 < ../patches/prefer-typo-ascender-descender-linegap.diff

echo "apply patch: bundle structure signature hack"
# this is a hack to let pdump be installed under Contents/MacOS and libexec
# under Contents/MacOS/libexec. To avoid an error on bundle structure when
# signing.
patch -d "$OUTPUT_DIR" -p1 < ../patches/bundle-signature-hack-9.0.diff
