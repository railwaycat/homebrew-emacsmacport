cask 'emacs-mac-spacemacs-icon-snapshot' do
  version 'emacs-26.1.91-mac'

  sha256 'e087f5aa19c28f3f403210247ef1902de2aa0f70c3346a3dad6d181ce04054f9'
  url 'https://github.com/railwaycat/build-macport/releases/download/26.1-mac-7.4/emacs-26.1.91-mac-head-10.12-spacemacs-icon.zip'

  name 'Emacs-mac-snapshot with spacemacs icon'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  conflicts_with cask: [
                        'emacs',
                        'emacs-mac',
                        'emacs-mac-snapshot',
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
