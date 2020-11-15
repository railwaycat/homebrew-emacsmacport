cask 'emacs-mac' do
  version 'emacs-27.1-mac-8.1'

  if MacOS.version >= :catalina
    sha256 '33035a0e190cf624860de57209c6190c8c2539520c1d0ecc2cc8fe2c08271125'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.1-mac-8.1/emacs-27.1-mac-8.1-10.15.5.zip'
  elsif MacOS.version == :mojave
    sha256 '66b6fef8a51a2dd9ed4f37c03315354ee4b01964b4473bfc69ec3a39fb88365f'
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
