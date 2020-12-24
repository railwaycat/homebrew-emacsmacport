#!/bin/sh

# disable all the automation to prevent unexpected time spending
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_AUTO_UPDATE=1

OS_VER=$(sw_vers -productVersion)

if [ $OS_VER != "10.13.6" ]; then
  # for version newer than 10.13, we can afford the upgrade time for homebrew
  # packages. Build with the latest version/.
  brew update
  # remove all installed formula and reinstall from Brewfile, prevent waste time
  # on upgrade all
  brew remove --force $(brew list --formula)
  brew bundle --file $(pwd)/build-scripts/Brewfile
else
  # for 10.13, homebrew upgrade package takes a ridiculous time way more than
  # the time limitation of CI, we have to skip it and use the shipping version
  # of CI VM.
  # brew bundle will fail on 10.13
  brew install texinfo
  brew install jansson
fi

# output the version of gnutls
brew info gnutls
