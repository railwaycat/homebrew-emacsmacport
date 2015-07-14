cask :v1 => 'emacs-mac' do
  version 'emacs-24.5-z-mac-5.9'

  sha256 'c583dd48a5148b801713d4005394aa813ea5ce4594f0228efd3a49f392b3965c'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-24.5-mac-5.9.zip'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
