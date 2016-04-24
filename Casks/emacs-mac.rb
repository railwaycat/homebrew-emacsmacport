cask 'emacs-mac' do
  version 'emacs-24.5-z-mac-5.16'

  sha256 'f88f729228bace93b351b352995be3fd056b08f02a7330efc2632aa51be8649a'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-24.5-mac-5.16.zip'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
