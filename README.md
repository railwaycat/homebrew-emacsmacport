# Emacs Mac Port

## What is Emacs Mac Port?
The official repository of Emacs Mac port: https://bitbucket.org/mituharu/emacs-mac/overview

> This is "Mac port" addition to GNU Emacs 29.  This provides a native
> GUI support for OS X 10.10 - macOS 13.  Note that Emacs 23 and later
> already contain the official GUI support via the NS (Cocoa) port.  So
> if it is good enough for you, then you don't need to try this.

Please see the full feature list
[here](https://bitbucket.org/mituharu/emacs-mac/src/master/README-mac).

### Emacs Mac Port 30 and above (the experimental repo)
Development from the official repository slowed down after Emacs 29
(29.4-mac-10.1) because the developer has been busy.
[@jdtsmith](https://github.com/jdtsmith) forked from upstream and is
doing experimental development for Emacs 30 and master.

I highly recommend that who want to use Emacs mac port >=30 read
[@jdtsmith](https://github.com/jdtsmith)'s
[README.md](https://github.com/jdtsmith/emacs-mac/blob/emacs-mac-30_1_exp/README.md)
before deciding to install from this tap via formula/casks. The README
file provides very detailed and comprehensive instructions for
building Emacs Mac Port from source code and for debugging.

## About this Homebrew tap
This Homebrew tap provides a collection of useful Homebrew formulas
and casks with popular patches, making it easier to install Emacs Mac
port on your Mac machine, either building from source code or
installing pre-built binaries from casks.

### If you encounter an issue
If it is:
- a build error when installing/upgrading any of the formulas
- Emacs.app from formula or cask fails to start or freezes
- other issues you are not certain about

Feel free to open an issue to this repo.

If it is a bug while using Emacs or related to a feature of Emacs Mac
Port 30 and above, please refer to the upstream repo:
<https://github.com/jdtsmith/emacs-mac/tree/emacs-mac-30_1_exp>

If it is any issue with Emacs Mac Port 28 and 29, please read the
following note from the developer first:

> If you find a bug, then please try to reproduce it with some
> official builds such as X11 or NS (Cocoa).  If it turns out to be
> specific to the Mac port, then please report it to
> <a href="mailto:mituharu+bug-gnu-emacs-mac@math.s.chiba-u.ac.jp">mituharu+bug-gnu-emacs-mac@math.s.chiba-u.ac.jp</a>.  Otherwise (i.e.,
> it is also reproducible with official ones), report it using <kbd>M-x</kbd>
> report-emacs-bug **USING THE OFFICIAL BUILD** as such.


## Installation options

### Homebrew
If you prefer to install with Homebrew, please enable this tap by:

```
$ brew tap railwaycat/emacsmacport
```

#### Formula
This tap provides the following formulas:

- `emacs-mac`: install the latest version of Emacs mac port 29.
- `emacs-mac@28`: install Emacs mac port 28.
- `emacs-mac@30exp`: install Emacs mac port 30 based on the experimental repo.
- `emacs-mac@31exp`: install Emacs mac port 31(master) based on the experimental repo. This formula is `--HEAD` only.

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
  - Ventura (macOS13) and later
* Apple Silicon Mac
  - Sonoma (macOS14)
  - Sequoia (macOS15) and later

For macOS versions not be listed above, please install from Homebrew
formula (install without `--cask`).

All bundles are built by GitHub Actions and available for all macOS
versions [GitHub hosted
runners](https://docs.github.com/en/actions/using-github-hosted-runners/using-github-hosted-runners/about-github-hosted-runners#standard-github-hosted-runners-for-public-repositories)
have.

## Useful links ##

* Emacs mac port on [MacPorts](https://www.macports.org/) (not be maintained by the maintainer of this repo):
  - [emacs-mac-app](https://ports.macports.org/port/emacs-mac-app/)
  - [emacs-mac-app-devel](https://ports.macports.org/port/emacs-mac-app-devel/)

* Switch meta and option key - https://gist.github.com/3498096

* For helper scripts/Apps to start Emacs.app, see [this document](https://github.com/railwaycat/homebrew-emacsmacport/blob/master/docs/emacs-start-helpers.md).
