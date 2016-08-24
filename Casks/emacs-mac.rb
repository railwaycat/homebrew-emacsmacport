cask 'emacs-mac' do
  version 'emacs-25.1-rc2-mac-5.91'

  sha256 '16afb0f49a9014812c73b2a9d6bc6367ad5101ddcc68379aae61e314b21f9300'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.1-rc2-mac-5.91.zip'
  name 'Emacs-mac'
  homepage 'https://www.gnu.org/software/emacs/'
  license :gpl

  app 'Emacs.app'
end
