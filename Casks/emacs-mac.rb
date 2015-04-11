cask :v1 => 'emacs-mac' do
  version 'emacs-24.5-z-mac-5.7'

  sha256 '3d10293010f4230fead1f84549fa8f69b86436f728027ca59603e92e42da8091'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-24.5-mac-5.7.zip'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
