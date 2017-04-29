cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-25.2-z-mac-6.3'

  sha256 '5074a791631f6ff61227a385c458293fef46e39a29284a53698236b962f54fd1'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.2-mac-6.3-spacemacs-icon.zip'
  name 'Emacs-mac with spacemacs icon'
  homepage 'https://www.gnu.org/software/emacs/'
  license :gpl

  app 'Emacs.app'
end
