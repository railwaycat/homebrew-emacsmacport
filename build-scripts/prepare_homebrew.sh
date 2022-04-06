#!/bin/sh

# disable all the automation to prevent unexpected time spending
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_AUTO_UPDATE=1

OS_VER=$(sw_vers -productVersion)

brew update
# remove all installed formula and reinstall from Brewfile, prevent waste time
# on upgrade all
# brew remove --force $(brew list --formula)
brew bundle --file $(pwd)/build-scripts/Brewfile

# output the version of gnutls
brew info gnutls
