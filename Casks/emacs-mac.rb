cask 'emacs-mac' do
  version 'emacs-25.3-mac-6.7'

  sha256 '2924ff6fd4e1acdc7bcc5e5c0fdd0307b00555d894affa8530eca104ca21dfa3'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-25.3-mac-6.7.zip'
  name 'Emacs-mac'
  homepage 'https://www.gnu.org/software/emacs/'

  app 'Emacs.app'
end
