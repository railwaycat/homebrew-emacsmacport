cask 'emacs-mac' do
  version 'emacs-26.1-z-mac-7.0'

  sha256 '30bcf4d98fb5052deea98a45d9896f22fe7d2246c3a2d668737dac0dd42a085a'

  url 'https://s3.amazonaws.com/emacs-mac-port/emacs-26.1-mac-7.0.zip'
  name 'Emacs-mac'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  app 'Emacs.app'
end
