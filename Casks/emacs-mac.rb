cask 'emacs-mac' do
  version 'emacs-27.2-mac-8.2'

  if Hardware::CPU.intel?
    if MacOS.version >= :mojave
      sha256 '1e2a797887e507233c5d0791ed23c0630597a26466e227ea07cd64e0b5e1a510'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.2-mac-8.2/emacs-27.2-mac-8.2-10.14.6.zip'
    else
      sha256 '68e1b74d1f7aeb75fa42e95d2523f97067ef34467ab449bd21902203749d4689'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.2-mac-8.2/emacs-27.2-mac-8.2-10.13.6.zip'
    end
  else
    # Arm Macs should be running macOS >= 11, let's add the version check in the future when necessary. 
    sha256 '4dec669fce2c00286e5491b32c6ff66fe97ca36253da2447f12a1241df3484e9'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.2-mac-8.2/emacs-27.2-mac-8.2-11.2.3-arm64.zip'
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
