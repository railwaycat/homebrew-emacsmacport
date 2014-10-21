class EmacsMac < Cask
  version 'emacs-24.4-mac-5.0'

  sha256 '3a766e86ef92f3b3850722179efc5a9e14b61683cab867cfe4a0a2f11a9445c8'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-mac-port-24.4-mac-5.0.zip'
  homepage 'http://www.gnu.org/software/emacs/'

  link 'Emacs.app'
end
