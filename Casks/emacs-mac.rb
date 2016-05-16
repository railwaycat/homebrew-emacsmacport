cask 'emacs-mac' do
  version 'emacs-24.5-z-mac-5.17'

  sha256 '7e5a32ecf298fe8b1f51ea2b17fdd6e02242ffeea5feee7914b664056bc06ca7'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-24.5-mac-5.17.zip'
  name 'Emacs-mac'
  homepage 'https://www.gnu.org/software/emacs/'
  license :gpl

  app 'Emacs.app'
end
