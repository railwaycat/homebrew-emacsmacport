cask :v1 => 'emacs-mac' do
  version 'emacs-24.5-rc3-mac-5.6'

  sha256 '707e9556323c89f15d3c29f4e83f61b37c87ddd4e4f3629c1c5d4b451e848aac'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-24.5-rc3-mac-5.6.zip'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
