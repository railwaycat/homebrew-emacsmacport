cask 'emacs-mac' do
  version 'emacs-24.5-z-mac-5.18'

  sha256 '64092b79102dd085884090a8f2a5e88c5a01ba90b48400a08eadcc09965544a1'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-24.5-mac-5.18.zip'
  name 'Emacs-mac'
  homepage 'https://www.gnu.org/software/emacs/'
  license :gpl

  app 'Emacs.app'
end
