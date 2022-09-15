cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-28.2-mac-9.1'

  if Hardware::CPU.intel?
    if MacOS.version <= :catalina
      odie "Because of the limitation of build system, there is no cask support for Catalina(10.15) and earlier, please build from Homebrew formula."
    elsif MacOS.version <= :big_sur
      sha256 '8bd96c3500d8cbb02a9102baac76e34c88a1b9fd2ac6af295ceb0410788be712'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.2-mac-9.1/emacs-28.2-mac-9.1-11.6.8-spacemacs-icon.zip'
    else
      # for macOS version is or newer than Big Sur
      # elsif MacOS.version <= :big_sur # reserved for later
      sha256 '7693e13cab343f081210f78973cb8b13b9bf768734a989afb87c64adb1e5902b'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.2-mac-9.1/emacs-28.2-mac-9.1-12.6-spacemacs-icon.zip'
    end
  else
    if MacOS.version <= :big_sur
      odie "Because of the limitation of build system, there is no Apple Silicon cask support for Big Sur(11) and earlier, please build from Homebrew formula."
    else
      # for macOS version is or newer than Big Sur
      # elsif MacOS.version <= :monterey # reserved for later
      sha256 '90f8c924e3dabe9e5344190c8e841f4d918b447a47899011f1909728dd79b64b'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.2-mac-9.1/emacs-28.2-mac-9.1-arm64-12.5.1-spacemacs-icon.zip'
    end
  end

  appcast 'https://github.com/railwaycat/homebrew-emacsmacport/releases.atom'
  name 'Emacs-mac with spacemacs icon'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'
  desc "YAMAMOTO Mitsuharu's Mac port of GNU Emacs"

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
