cask 'emacs-mac' do
  version 'emacs-25.2-z-mac-6.6'

  sha256 '07522629f95178de26744a3c1730d8efa7d9009ae94585fd6fe5947c1d4a1561'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.2-mac-6.6.zip'
  name 'Emacs-mac'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
