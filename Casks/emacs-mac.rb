cask 'emacs-mac' do
  version 'emacs-25.2-z-mac-6.4'

  sha256 '61a15928dae9463affc662316c1771355f271c341071b2e12971116c3d850800'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.2-mac-6.4.zip'
  name 'Emacs-mac'
  homepage 'https://www.gnu.org/software/emacs/'
  license :gpl

  app 'Emacs.app'
end
