cask :v1 => 'emacs-mac' do
  version 'emacs-24.4-mac-5.3'

  sha256 '255977f9e68e347152b59a095c89de15e4f85c93fe3dd1c3bd891ab1c1ba5e71'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-mac-port-24.4-mac-5.3.zip'
  homepage 'http://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
