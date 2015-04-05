cask :v1 => 'emacs-mac' do
  version 'emacs-24.5-rc2-mac-5.6'

  sha256 'bffa77045df0c23101fb75a8cbb5db7946b147d79da725c99513b0357ca9fe7c'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-24.5-rc2-mac-5.6.zip'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
