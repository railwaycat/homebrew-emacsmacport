cask 'emacs-mac' do
  version 'emacs-26.1-rc1-mac-6.90'

  sha256 '80b6519a88259f9abbb892b73609e4bcd9da2c079558be8a0868a140eb03a6d8'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-26.1-rc1-mac-6.90.zip'
  name 'Emacs-mac'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  app 'Emacs.app'
end
