cask 'emacs-mac' do
  version 'emacs-26.1-z-mac-7.1'

  sha256 '579c0534f4c3c37303c6b50b757b6c88264555a6f5dec0a5d7562dc417d193ff'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-26.1-mac-7.1.zip'
  name 'Emacs-mac'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  app 'Emacs.app'
end
