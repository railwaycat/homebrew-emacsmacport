cask 'emacs-mac-official-icon' do
  version 'emacs-25.2-z-mac-6.5'

  sha256 '06db20040df9f1502e45a62ab2e269c8f68676e6a71c22607f663c6a2aa906c1'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.2-mac-6.5-official-icon.zip'
  name 'Emacs-mac with official icon'
  homepage 'https://www.gnu.org/software/emacs/'
  license :gpl

  app 'Emacs.app'
end
