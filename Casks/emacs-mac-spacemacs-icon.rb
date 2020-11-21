cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-27.1-mac-8.1'

  if MacOS.version >= :mojave
    sha256 '4a7b2fc277b42c2e00b848e0dc8e3bc19c3a833165a940f5710ad1b6a594a50d'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.1-mac-8.1/emacs-27.1-mac-8.1-10.14.6-spacemacs-icon.zip'
  else
    sha256 '39148ffd86754384351715301039c46c43ed5d929845171599b4e9bae337f3ba'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.1-mac-8.1/emacs-27.1-mac-8.1-10.13.6-spacemacs-icon.zip'
  end

  appcast 'https://github.com/railwaycat/homebrew-emacsmacport/releases.atom'
  name 'Emacs-mac with spacemacs icon'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  conflicts_with cask: [
                        'emacs',
                        'emacs-mac',
                       ]

  app 'Emacs.app'
  binary "#{appdir}/Emacs.app/Contents/MacOS/Emacs.sh", target: 'emacs'
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/ebrowse"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/emacsclient"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/etags"
  binary "#{appdir}/Emacs.app/Contents/Resources/include/emacs-module.h", target: "#{HOMEBREW_PREFIX}/include/emacs-module.h"

  zap trash: [
               '~/Library/Caches/org.gnu.Emacs',
               '~/Library/Preferences/org.gnu.Emacs.plist',
               '~/Library/Saved Application State/org.gnu.Emacs.savedState',
             ]

end
