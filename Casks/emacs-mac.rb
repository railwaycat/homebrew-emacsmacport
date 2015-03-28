cask :v1 => 'emacs-mac' do
  version 'emacs-24.5-rc1-mac-5.6'

  sha256 '073ea8c28c6d26a658bbd227b35a01f668e82f1e049d0855529a017a74b6bbd1'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-24.5-rc1-mac-5.6.zip'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
