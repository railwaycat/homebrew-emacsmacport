cask 'emacs-mac' do
  version 'emacs-25.1-z-mac-6.1'

  sha256 'bd132f46f90014fd23cbe2f38e32257a4e1b4b5f77144bcb10f9f0bd011eb0f3'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.1-mac-6.1.zip'
  name 'Emacs-mac'
  homepage 'https://www.gnu.org/software/emacs/'
  license :gpl

  app 'Emacs.app'
end
