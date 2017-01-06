cask 'emacs-mac' do
  version 'emacs-25.1-z-mac-6.1'

  sha256 '944b5199ed41756d391776a540a6c4cba6118f0295be389a35035e8c09b45d5d'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.1-mac-6.1-official-icon.zip'
  name 'Emacs-mac'
  homepage 'https://www.gnu.org/software/emacs/'
  license :gpl

  app 'Emacs.app'
end
