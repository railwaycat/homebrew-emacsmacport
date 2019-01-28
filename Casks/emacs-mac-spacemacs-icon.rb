cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-26.1-z-mac-7.4'

  sha256 '7975da3dfaf71f6b166d4ad6be3524286e0fb61cd75007eca93c7a8aec37736b'
  url 'https://github.com/railwaycat/build-macport/releases/download/26.1-mac-7.4/emacs-26.1-mac-7.4-10.12-spacemacs-icon.zip'
  appcast 'https://github.com/railwaycat/build-macport/releases.atom'
  name 'Emacs-mac with spacemacs icon'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  conflicts_with cask: [
                        'emacs',
                        'emacs-mac',
                        'emacs-mac-snapshot',
                        'emacs-mac-spacemacs-icon-snapshot'
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
