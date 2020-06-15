cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-26.3-z-mac-7.9.1'

  if MacOS.version >= :mojave
    sha256 '178d28c85297a97dd525c97d579401bfa927a18a6317d4f4e7e07fe94df8bd9e'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.9.1/emacs-26.3-mac-7.9-10.14.6-spacemacs-icon.zip'
  else
    sha256 'a862fc27277f41819c6b4b4d0210ac13d2956d8df6b6c6003e6e7788cd4bdc16'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.9.1/emacs-26.3-mac-7.9-10.13.6-spacemacs-icon.zip'
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
