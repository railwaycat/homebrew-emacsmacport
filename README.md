# Emacs Mac Port

## What is this? ##

This is "Mac port" addition to GNU Emacs 24.  This provides a native
GUI support for Mac OS X 10.4 - 10.11.  Note that Emacs 23 and later
already contain the official GUI support via the NS (Cocoa) port for
Mac OS X 10.4 and later.  So if it is good enough for you, then you
don't need to try this.

#### IMPORTANT NOTE ####

If you find a bug, then please try to reproduce it with some
official builds such as X11 or NS (Cocoa).  If it turns out to be
specific to the Mac port, then please report it to
<a href="mailto:mituharu+bug-gnu-emacs-mac@math.s.chiba-u.ac.jp">mituharu+bug-gnu-emacs-mac@math.s.chiba-u.ac.jp</a>.  Otherwise (i.e.,
it is also reproducible with official ones), report it using <kbd>M-x</kbd>
report-emacs-bug *USING THE OFFICIAL BUILD* as such.

## Features ##
This build has *many* features, a great number of which are particularly helpful for Mac users. You can see the full list <a href="https://github.com/railwaycat/mirror-emacs-mac/blob/master/README-mac">here</a>. 


## Installation options ##


### Homebrew ###
If you'd like to install with Homebrew, please

`$ brew tap railwaycat/emacsmacport`

and then
 
`$ brew install emacs-mac`

if you using cask

`brew cask install emacs-mac`

To disable this tap, please:

`$ brew untap railwaycat/emacsmacport`

### Pre-built Download ###

https://github.com/railwaycat/homebrew-emacsmacport/releases

## Useful links ##

* Switch meta and option key - https://gist.github.com/3498096

* An Emacs.app CLI starter, modified from Aquamacs - https://gist.github.com/4043945
