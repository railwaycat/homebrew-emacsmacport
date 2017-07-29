cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-25.2-z-mac-6.5'

  sha256 'cea1646613e7143f4ea61aae662f7432d0ea9ae7b44c051fa8306a29499f0e34'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.2-mac-6.5-spacemacs-icon.zip'
  name 'Emacs-mac with spacemacs icon'
  homepage 'https://www.gnu.org/software/emacs/'
  license :gpl

  app 'Emacs.app'
end
