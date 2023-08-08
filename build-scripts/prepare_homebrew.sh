#!/bin/sh

# Use a fresh homebrew under $HOME. May not needed in most of the
# cases
new_homebrew () {
  BREW_DIR="$HOME/homebrew"

  mkdir "$BREW_DIR" && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C "$BREW_DIR"

  eval "$($BREW_DIR/bin/brew shellenv)"
}

# disable all the automation to prevent unexpected time spending
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_AUTO_UPDATE=1

OS_VER=$(sw_vers -productVersion)

set -e

brew update --force --quiet

# brew update remove all installed formula and reinstall from
# Brewfile, prevent waste time on upgrade all
# brew remove --force $(brew list --formula)
brew bundle --force cleanup --file ./Brewfile
brew bundle --file ./Brewfile
# build gnutls from source code, to ensure the absolute path for
# linked libs
brew install --build-from-source gnutls

brew list
