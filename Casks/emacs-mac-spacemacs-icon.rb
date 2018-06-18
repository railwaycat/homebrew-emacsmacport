cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-26.1-z-mac-7.1'

  sha256 'efd9e32fa8d71a6f92758bb83a82c99df879188b7960c717eb1c5d6d90b9fbd2'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-26.1-mac-7.1-spacemacs-icon.zip'
  name 'Emacs-mac with spacemacs icon'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  app 'Emacs.app'
end
