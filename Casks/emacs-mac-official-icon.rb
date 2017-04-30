cask 'emacs-mac-official-icon' do
  version 'emacs-25.2-z-mac-6.3'

  sha256 'aad452eee1cc42ec17e8abf1b3a3ea77310768b88d86322651fc7a53055700fe'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.2-mac-6.3-official-icon.zip'
  name 'Emacs-mac with official icon'
  homepage 'https://www.gnu.org/software/emacs/'
  license :gpl

  app 'Emacs.app'
end
