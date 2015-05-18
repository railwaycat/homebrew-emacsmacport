cask :v1 => 'emacs-mac' do
  version 'emacs-24.5-z-mac-5.8'

  sha256 '8e75d7c8f5c57304acd0200c49e71b51e33569bfea9a0726bcd9d5f654c27f16'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-24.5-mac-5.8.zip'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
