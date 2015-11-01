cask :v1 => 'emacs-mac' do
  version 'emacs-24.5-z-mac-5.13'

  sha256 'bd095bd823249c3e6b9d7b4545985c346dd3f23d6efe44631c5cc136349967bf'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-24.5-mac-5.13.zip'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
