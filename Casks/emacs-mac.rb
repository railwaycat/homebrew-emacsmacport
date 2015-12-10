cask :v1 => 'emacs-mac' do
  version 'emacs-24.5-z-mac-5.14'

  sha256 'b1ad88800bd9e641ed8825496e957119f8ff510c801252add1a576cc49c02781'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-24.5-mac-5.14.zip'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
