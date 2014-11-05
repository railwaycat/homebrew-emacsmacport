class EmacsMac < Cask
  version 'emacs-24.4-mac-5.1'

  sha256 'fd23e81a2c07ddbad4d68b298ab53102b34e0e2610d6eab3e4466066ff54b6cf'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-mac-port-24.4-mac-5.1.zip'
  homepage 'http://www.gnu.org/software/emacs/'

  link 'Emacs.app'
end
