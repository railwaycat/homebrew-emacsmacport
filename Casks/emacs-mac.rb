cask 'emacs-mac' do
  version 'emacs-25.1-mac-6.0'

  sha256 '5152b6cc403914c6333a677faf28247a98c1126c95382665b228113840ac3dfe'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.1-mac-6.0.zip'
  name 'Emacs-mac'
  homepage 'https://www.gnu.org/software/emacs/'
  license :gpl

  app 'Emacs.app'
end
