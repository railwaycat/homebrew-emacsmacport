cask 'emacs-mac' do
  version 'emacs-25.3-mac-6.8'

  sha256 '2f36bac3412c145892aa7b3550b17910883035b957b14b5b5f58316361590540'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.3-mac-6.8.zip'
  name 'Emacs-mac'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
