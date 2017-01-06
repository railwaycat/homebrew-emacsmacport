cask 'emacs-mac' do
  version 'emacs-25.1-z-mac-6.1'

  sha256 '41230bfe0f87b3e58fe6c2f747cbfc688b4d9623728f9509fe654c4116c81877'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.1-mac-6.1-official-icon.zip'
  name 'Emacs-mac'
  homepage 'https://www.gnu.org/software/emacs/'
  license :gpl

  app 'Emacs.app'
end
