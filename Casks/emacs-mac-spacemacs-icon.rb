cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-26.1-rc1-mac-6.90'

  sha256 '51bd2fe7fd9fe39ed0b1328e909ea4fff279b50523fc447f992940b1bff704f2'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-26.1-rc1-mac-6.90-spacemacs-icon.zip'
  name 'Emacs-mac with spacemacs icon'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  app 'Emacs.app'
end
