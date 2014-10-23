class EmacsMac < Cask
  version 'emacs-24.4-mac-5.0'

  sha256 '7e09c899e5487c21634aea4220101f739227fcbbcd34f7998d2a98e87fc00aa2'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-mac-port-24.4-mac-5.0.zip'
  homepage 'http://www.gnu.org/software/emacs/'

  link 'Emacs.app'
end
