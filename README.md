# Emacs Mac Port

## What is this?

The official repository of Emacs Mac port: https://bitbucket.org/mituharu/emacs-mac/overview

This is "Mac port" addition to GNU Emacs. This provides a native GUI
support for OS X 10.10 - macOS 13. Note that Emacs 23 and later
already contain the official GUI support via the NS (Cocoa) port. So
if it is good enough for you, then you don't need to try this.

This Homebrew tap provides a collection of useful Homebrew formulas
and casks with popular patches, making it easier to install Emacs Mac
port on your Mac machine. It also offers pre-built bundles if you
prefer not to use Homebrew.

#### IMPORTANT Note From Developer

If you find a bug, then please try to reproduce it with some
official builds such as X11 or NS (Cocoa).  If it turns out to be
specific to the Mac port, then please report it to
<a href="mailto:mituharu+bug-gnu-emacs-mac@math.s.chiba-u.ac.jp">mituharu+bug-gnu-emacs-mac@math.s.chiba-u.ac.jp</a>.  Otherwise (i.e.,
it is also reproducible with official ones), report it using <kbd>M-x</kbd>
report-emacs-bug **USING THE OFFICIAL BUILD** as such.


## Features
Please see the full feature list <a href="https://bitbucket.org/mituharu/emacs-mac/src/master/README-mac">here</a>.


## Installation options

### Homebrew
If you prefer to install with Homebrew, please enable this tap by:

```
$ brew tap railwaycat/emacsmacport
```

#### Formula
This tap provides the following formulas:

- `emacs-mac`: install the latest version of Emacs mac port (currently based on Emacs 29).
- `emacs-mac@28`: install Emacs mac port based on Emacs 28.

#### Cask
This tap provides the following casks, based on Emacs 29:

- `emacs-mac`
- `emacs-mac-spacemacs-icon`

and the following casks, based on Emacs 28:

- `emacs-mac-28`
- `emacs-mac-28-spacemacs-icon`

All of these casks can be installed by `brew install --cask` command.

### Pre-built Download ###

Pre-built bundles available on the release page:

https://github.com/railwaycat/homebrew-emacsmacport/releases

Bundles are the same as those from Homebrew Cask.

Support macOS versions:

* Intel Mac
  - Monterey (macOS12)
  - Big Sur (macOS11)
  - Ventura (macOS13)
* Apple Silicon Mac
  - Monterey (macOS12)
  - Ventura (macOS13)

For macOS versions not be listed above, please install from Homebrew
formula (install without `--cask`).

Intel Mac bundles are built by GitHub Actions, the version support
limitation is from the macOS versions they
[support](https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners#supported-runners-and-hardware-resources)
currently.

Apple Silicon bundles are built on a M1 Mac with
[Tart](https://github.com/cirruslabs/tart). The version support
limitation is because Apple only supports macOS virtualization since
Monterey (macOS12).

## Useful links ##

* Emacs mac port on [MacPorts](https://www.macports.org/) (not be maintained by the maintainer of this repo):
  - [emacs-mac-app](https://ports.macports.org/port/emacs-mac-app/)  
  - [emacs-mac-app-devel](https://ports.macports.org/port/emacs-mac-app-devel/)

* Switch meta and option key - https://gist.github.com/3498096

* For helper scripts/Apps to start Emacs.app, see [this document](https://github.com/railwaycat/homebrew-emacsmacport/blob/master/docs/emacs-start-helpers.md).
