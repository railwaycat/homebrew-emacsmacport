cask 'emacs-mac-official-icon' do
  version 'emacs-25.3-mac-6.7'

  sha256 '24ef3edc49eaeae68e58bf95053010109845d27b33b2ee752c64829f994866a2'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.3-mac-6.7-official-icon.zip'
  name 'Emacs-mac with official icon'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
