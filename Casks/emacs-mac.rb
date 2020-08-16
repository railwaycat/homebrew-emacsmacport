cask 'emacs-mac' do
  version 'emacs-27.1-mac-8.0.1'

  if MacOS.version >= :mojave
    sha256 '491d8013a15e77e3a10221bd4f1fa965edc0f14432b59152840aefe9a5c80067'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.1-mac-8.0.1/emacs-27.1-mac-8.0.1-10.14.6.zip'
  else
    sha256 'b2efaf27048986a76ce077560683e81220f7c4656e939deeff0bdee69d95ae6b'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.1-mac-8.0.1/emacs-27.1-mac-8.0.1-10.13.6.zip'
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
