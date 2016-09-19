cask 'emacs-mac' do
  version 'emacs-25.1-z-mac-6.0'

  sha256 '3a93523ababd2a53789b54b01e45accdb2b9f0fe5effc2760d540a3736e9f490'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.1-mac-6.0.zip'
  name 'Emacs-mac'
  homepage 'https://www.gnu.org/software/emacs/'
  license :gpl

  app 'Emacs.app'
end
