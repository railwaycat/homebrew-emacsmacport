# Emacs Mac Port

## What is this? ##

Official repository: https://bitbucket.org/mituharu/emacs-mac/overview

This is "Mac port" addition to GNU Emacs 28.  This provides a native
GUI support for OS X 10.10 - macOS 12.  Note that Emacs 23 and later
already contain the official GUI support via the NS (Cocoa) port.  So
if it is good enough for you, then you don't need to try this.

#### IMPORTANT NOTE ####

If you find a bug, then please try to reproduce it with some
official builds such as X11 or NS (Cocoa).  If it turns out to be
specific to the Mac port, then please report it to
<a href="mailto:mituharu+bug-gnu-emacs-mac@math.s.chiba-u.ac.jp">mituharu+bug-gnu-emacs-mac@math.s.chiba-u.ac.jp</a>.  Otherwise (i.e.,
it is also reproducible with official ones), report it using <kbd>M-x</kbd>
report-emacs-bug **USING THE OFFICIAL BUILD** as such.

## Features ##
This build has *many* features, a great number of which are particularly helpful for Mac users. You can see the full list <a href="https://bitbucket.org/mituharu/emacs-mac/src/master/README-mac">here</a>. 


## Installation options ##


### Homebrew ###
If you'd like to install with Homebrew, please

`$ brew tap railwaycat/emacsmacport`

and then
 
`$ brew install emacs-mac`

if you using cask

`brew install --cask emacs-mac` or `brew install --cask emacs-mac-spacemacs-icon`

To disable this tap, please:

`$ brew untap railwaycat/emacsmacport`

### Pre-built Download ###

https://github.com/railwaycat/homebrew-emacsmacport/releases

Pre-built for macOS 10.13(High Sierra)/10.14(Mojave) and above, please
download based on your macOS version. Due to the limitation of Travis-CI,
pre-built for macOS before 10.13 is not supported for now, please install by homebrew
(without `--cask`) in case you are using an older version macOS. 

## Useful links ##

* Switch meta and option key - https://gist.github.com/3498096

* Emacs mac port on [MacPorts](https://www.macports.org/) (not be maintained by the maintainer of this repo):
  - [emacs-mac-app](https://ports.macports.org/port/emacs-mac-app/)  
  - [emacs-mac-app-devel](https://ports.macports.org/port/emacs-mac-app-devel/)

* An Emacs.app CLI starter, modified from Aquamacs - https://gist.github.com/4043945

## Included Patches Information ##

* No title bar
  `--with-no-title-bars`  
  Enabled by default when build with this patch. This feature can been controlled by `mac-use-title-bar`, a boolean with default value `false`. Value settings will been used in new frame **after** Emacs started. (<- yes this is a bug).
  
* Natural title bar
  `--with-natural-title-bar`  
  Disabled by default when build with this patch, more information see this [wiki page](https://github.com/railwaycat/homebrew-emacsmacport/wiki/Natural-Title-Bar)
