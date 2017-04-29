cask 'emacs-mac' do
  version 'emacs-25.2-z-mac-6.3'

  sha256 '4943fa8b21dfb12d51e93d15887b95266256e7a402ba44fd6d0b077ca08d465b'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.2-mac-6.3.zip'
  name 'Emacs-mac'
  homepage 'https://www.gnu.org/software/emacs/'
  license :gpl

  app 'Emacs.app'
end
