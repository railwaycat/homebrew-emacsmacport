cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-25.2-z-mac-6.4'

  sha256 '205dfcbdda2bb658c2256e01cda2f71aeda5d48542374314cdd011db36c30c7d'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.2-mac-6.4-spacemacs-icon.zip'
  name 'Emacs-mac with spacemacs icon'
  homepage 'https://www.gnu.org/software/emacs/'
  license :gpl

  app 'Emacs.app'
end
