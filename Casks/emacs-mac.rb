cask 'emacs-mac' do
  version 'emacs-24.5-z-mac-5.15'

  sha256 '66571ecd8ea14c6e8ce63d1d60fdbaff66f81e2a3ae45c45102a0fb9e5d3ada6'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-24.5-mac-5.15.zip'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
