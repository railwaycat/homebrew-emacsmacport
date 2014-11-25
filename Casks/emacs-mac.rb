cask :v1 => 'emacs-mac' do
  version 'emacs-24.4-mac-5.2'

  sha256 '7d37b9a4d444853c1caa7caa7a931f91d0763e217457629800535daf5f141df5'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-mac-port-24.4-mac-5.2.zip'
  homepage 'http://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
