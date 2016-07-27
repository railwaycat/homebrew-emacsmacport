cask 'emacs-mac' do
  version 'emacs-25.1-rc1-mac-5.90'

  sha256 '173d10eb7e720b0c72d5fbeb3aded2d380f6de43dc8e5c890a2836e508a575bf'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.1-rc1-mac-5.90.zip'
  name 'Emacs-mac'
  homepage 'https://www.gnu.org/software/emacs/'
  license :gpl

  app 'Emacs.app'
end
