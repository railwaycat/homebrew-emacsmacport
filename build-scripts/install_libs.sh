#!/bin/bash

set -e

SCRIPT_DIR=$1
OUTPUT_DIR=$2

# only use when on a separated homebrew
# BREW_DIR="$HOME/homebrew"
# eval "$($BREW_DIR/bin/brew shellenv)"

pushd "$OUTPUT_DIR"
"$SCRIPT_DIR/copylib.rb" $(brew --prefix)
popd
