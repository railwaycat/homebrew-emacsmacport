cask :v1 => 'emacs-mac' do
  version 'emacs-24.5-z-mac-5.10'

  sha256 '2983898fdba78d4da6734497a43ccec57bcb4bd2ed73fe4f911fc9d6452a2e62'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-24.5-mac-5.10.zip'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
