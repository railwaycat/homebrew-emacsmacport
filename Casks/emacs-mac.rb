cask 'emacs-mac' do
  version 'emacs-26.1-z-mac-7.2'

  if MacOS.version >= :mojave
    sha256 '8b23f75ced828a06c85966f3ad05e6bd494a466d38e39d9017a93d9ed501f2d9'
    url 'https://s3.amazonaws.com/emacs-mac-port/emacs-26.1-mac-7.2-10.14.zip'
  else
    sha256 '7edc1aa09f9d20942f2091ba31e5d2b190ae73f7b46834f6844eb974c2e3f6f8'
    url 'https://s3.amazonaws.com/emacs-mac-port/emacs-26.1-mac-7.2-10.9.zip'
	end

  name 'Emacs-mac'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  conflicts_with cask: [
                        'emacs',
                        'emacs-mac-spacemacs-icon'
                       ]

  app 'Emacs.app'
  binary "#{appdir}/Emacs.app/Contents/MacOS/Emacs", target: 'emacs'
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/ebrowse"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/emacsclient"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/etags"

  zap trash: [
               '~/Library/Caches/org.gnu.Emacs',
               '~/Library/Preferences/org.gnu.Emacs.plist',
               '~/Library/Saved Application State/org.gnu.Emacs.savedState',
             ]

end
