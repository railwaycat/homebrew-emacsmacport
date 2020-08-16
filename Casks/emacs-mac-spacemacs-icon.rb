cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-27.1-mac-8.0.1'

  if MacOS.version >= :mojave
    sha256 'b104d5986442a482bff8a6cb527c81f426a8246807c2a0f5dd3cc8d48a5d273a'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.1-mac-8.0.1/emacs-27.1-mac-8.0.1-10.14.6-spacemacs-icon.zip'
  else
    sha256 '1cec174b1e2ea4010475239a43ec5e508e47d4339ef8c5407d4b0e5135cefc8f'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.1-mac-8.0.1/emacs-27.1-mac-8.0.1-10.13.6-spacemacs-icon.zip'
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
