cask 'emacs-mac-snapshot' do
  version 'emacs-26.1.91-mac'

  sha256 'd8fd41fe7aa32cc7c539d56739f6ba76597dd9c98679ef1bea28d1849b2083cd'
  url 'https://github.com/railwaycat/build-macport/releases/download/26.1-mac-7.4/emacs-26.1.91-mac-head-10.12.zip'

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
