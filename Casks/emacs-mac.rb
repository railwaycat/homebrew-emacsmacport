cask 'emacs-mac' do
  version 'emacs-25.2-z-mac-6.5'

  sha256 '9a69d22cb2445ce0608ae8569fb4eb0e50f631ed366d7f2501f888ff26ebe3bf'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.2-mac-6.5.zip'
  name 'Emacs-mac'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
