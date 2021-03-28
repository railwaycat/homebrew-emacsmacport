cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-27.2-mac-8.2'

  if Hardware::CPU.intel?
    if MacOS.version >= :mojave
      sha256 '3a5294278a2daf142d78ee6a596c6b10f4544cc5eb5d27339c33ef0d17a4a0ed'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.2-mac-8.2/emacs-27.2-mac-8.2-10.14.6-spacemacs-icon.zip'
    else
      sha256 'ed8b673986cdfef12e466bb4de56dc1074f8165560baaac41b5536ffdbf4146f'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.2-mac-8.2/emacs-27.2-mac-8.2-10.13.6-spacemacs-icon.zip'
    end
  else
    # Arm Macs should be running macOS >= 11, let's add the version check in the future when necessary. 
    sha256 '57323539f09cf781514e0641508984a67d9039f3441c07ca87b35d387d0bf32b'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.2-mac-8.2/emacs-27.2-mac-8.2-11.2.3-arm64-spacemacs-icon.zip'
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
  binary "#{appdir}/Emacs.app/Contents/Resources/site-lisp/subdirs.el", target: "#{HOMEBREW_PREFIX}/share/emacs/site-lisp/subdirs.el"

  zap trash: [
               '~/Library/Caches/org.gnu.Emacs',
               '~/Library/Preferences/org.gnu.Emacs.plist',
               '~/Library/Saved Application State/org.gnu.Emacs.savedState',
             ]

end
