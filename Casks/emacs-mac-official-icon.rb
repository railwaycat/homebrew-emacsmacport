cask 'emacs-mac-official-icon' do
  version 'emacs-25.2-z-mac-6.6'

  sha256 '9bdab784877470ded5e0ba3ead127b175631125ed75de187a85f69e8d8791176'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.2-mac-6.6-official-icon.zip'
  name 'Emacs-mac with official icon'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
