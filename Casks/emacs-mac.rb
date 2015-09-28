cask :v1 => 'emacs-mac' do
  version 'emacs-24.5-z-mac-5.11'

  sha256 'c243705dc5e3fea0cfe70b9530ee9382c402445b3b3b7712902293af01d04078'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-24.5-mac-5.11.zip'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
