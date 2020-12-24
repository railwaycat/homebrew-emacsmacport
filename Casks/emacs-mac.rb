cask 'emacs-mac' do
  version 'emacs-27.1-mac-8.1'

  if MacOS.version >= :mojave
    sha256 'cd6fec3a33ae9a12fca1d1fad35bfa8f12489d518c1e2bbd207df6d6eb251d01'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.1-mac-8.1/emacs-27.1-mac-8.1-10.14.6.zip'
  else
    sha256 '41a02e4193bc722b67426791cf210fd7581f8e4faf28e3feb9b78ced183c2c8e'
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
  binary "#{appdir}/Emacs.app/Contents/Resources/site-lisp/subdirs.el", target: "#{HOMEBREW_PREFIX}/share/emacs/site-lisp/subdirs.el"

  zap trash: [
               '~/Library/Caches/org.gnu.Emacs',
               '~/Library/Preferences/org.gnu.Emacs.plist',
               '~/Library/Saved Application State/org.gnu.Emacs.savedState',
             ]

end
