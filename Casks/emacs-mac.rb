cask 'emacs-mac' do
  version 'emacs-27.1-mac-8.1'

  if MacOS.version >= :catalina
    sha256 '94c07effbbbdeafda477d8eba2201ecd6c4f4299e9e83d7a1a38ec0dd0eabb51'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.1-mac-8.1/emacs-27.1-mac-8.1-10.15.5.zip'
  elsif MacOS.version == :mojave
    sha256 '8c63966e5f1ac2b642cf41226d8cce1cf367238221cc67592a05056f076faf88'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.1-mac-8.1/emacs-27.1-mac-8.1-10.14.6.zip'
  else
    sha256 'b771a463a3556b5c577c135733ef9c7bf236a072a941965dc06ac44628b175e0'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.1-mac-8.1/emacs-27.1-mac-8.1-10.13.6.zip'
  end

  appcast 'https://github.com/railwaycat/homebrew-emacsmacport/releases.atom'
  name 'Emacs-mac'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  conflicts_with cask: [
                        'emacs',
                        'emacs-mac-spacemacs-icon',
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
