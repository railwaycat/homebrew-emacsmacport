cask 'emacs-mac-official-icon' do
  version 'emacs-25.3-mac-6.8'

  sha256 '82577767ffe8e0779fa34e4ac1618e727b359e9077ffd3143737f4aa1c45789c'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.3-mac-6.8-official-icon.zip'
  name 'Emacs-mac with official icon'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
