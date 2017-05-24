cask 'emacs-mac-official-icon' do
  version 'emacs-25.2-z-mac-6.4'

  sha256 'a2df4eb2dc063667950c00e565939961d74af895791a0c85760664283d41737b'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.2-mac-6.4-official-icon.zip'
  name 'Emacs-mac with official icon'
  homepage 'https://www.gnu.org/software/emacs/'
  license :gpl

  app 'Emacs.app'
end
