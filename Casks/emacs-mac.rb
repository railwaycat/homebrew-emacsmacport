cask 'emacs-mac' do
  version 'emacs-25.2-rc1-mac-6.2'

  sha256 'aa951f1b2b8101bd06bdd6d790b26277ae22949395ec531d863cd0c9e807ede8'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.2-rc1-mac-6.2.zip'
  name 'Emacs-mac'
  homepage 'https://www.gnu.org/software/emacs/'
  license :gpl

  app 'Emacs.app'
end
