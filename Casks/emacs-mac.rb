cask :v1 => 'emacs-mac' do
  version 'emacs-24.4.90-mac-5.4'

  sha256 '7146fb86bad8a398832a295a2472b7c8bb73a489616e04a536667b5d565b184b'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-mac-port-24.4.90-mac-5.4.zip'
  homepage 'http://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
