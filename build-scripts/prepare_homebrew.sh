#!/bin/sh

# disable all the automation to prevent unexpected time spending
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_AUTO_UPDATE=1

set -e

brew update --force --quiet
