cask 'emacs-mac-spacemacs-icon-snapshot' do
  version 'emacs-mac-967b705'

  sha256 'b23da40946165e3721b3e3f822e99da1aec3765eb683317d6092950150c96520'
  url 'https://github.com/railwaycat/build-macport/releases/download/snapshot-967b705/emacs-26.1.92-mac-head-10.12-spacemacs-icon.zip'
  appcast 'https://github.com/railwaycat/build-macport/releases.atom'
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
