cask :v1 => 'emacs-mac' do
  version 'emacs-24.4.91-mac-5.5'

  sha256 '4627f1778b0bb4fbfece14deb88e14d00fd8d0a6dc3535b686be92e78dc60f55'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-mac-port-24.4.91-mac-5.5.zip'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
