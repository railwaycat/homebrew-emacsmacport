cask 'emacs-mac-custom' do
  version 'emacs-27.1-mac-8.1-custom'

  sha256 'cd6fec3a33ae9a12fca1d1fad35bfa8f12489d518c1e2bbd207df6d6eb251d01'
  url 'https://github.com/alexandreBouayad/homebrew-emacsmacport/releases/download/emacs-27.1-mac-8.1-custom/emacs-27.1-mac-8.1-custom.zip'

  name 'Emacs-mac-custom'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  conflicts_with cask: [
    'emacs',
    'emacs-mac-spacemacs-icon',
    'emacs-mac'
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
