cask 'emacs-mac-snapshot' do
  version 'emacs-mac-967b705'

  sha256 'fe5c6748cdac2e34c70fe83abb45a031d0ca7b7054cf63c9bb488735093abddf'
  url 'https://github.com/railwaycat/build-macport/releases/download/snapshot-967b705/emacs-26.1.92-mac-head-10.12.zip'
  appcast 'https://github.com/railwaycat/build-macport/releases.atom'
  name 'Emacs-mac-snapshot'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  conflicts_with cask: [
                        'emacs',
                        'emacs-mac',
                        'emacs-mac-spacemacs-icon',
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
