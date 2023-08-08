#!/bin/bash

set -e

EMACS_VER="29.1"
MACPORT_VER="$EMACS_VER-mac-10.0"
COMMIT_HASH="65c6c96f27afa446df6f9d8eff63f9cc012cc738"
OUTPUT_DIR="build_out"

./prepare_homebrew.sh

./fetch-emacs-mac-port.sh "$MACPORT_VER" "$COMMIT_HASH" "$OUTPUT_DIR"

./build-emacs.sh "$OUTPUT_DIR" "$EMACS_VER"

./install_libs.sh $(pwd) "$OUTPUT_DIR"

./make-zipball.sh "$OUTPUT_DIR/tmproot" "$MACPORT_VER"

ls -d $OUTPUT_DIR/tmproot/*.zip
