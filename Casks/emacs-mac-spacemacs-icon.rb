cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-28.1-mac-9.0.1'

  if Hardware::CPU.intel?
    if MacOS.version <= :mojave
      odie "Because of the limitation of build system, there is no cask support for mojave(10.14) and earlier, please build from Homebrew formula."
    elsif MacOS.version <= :catalina
      sha256 '7e16185a41b8197339e9e5f943d5c68f039f230b7350dfab883e0f2668c04a56'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.1-mac-9.0.1/emacs-28.1-mac-9.0.1-10.15.7-spacemacs-icon.zip'
    else
      # for macOS version is or newer than Big Sur
      # elsif MacOS.version <= :big_sur # reserved for later
      sha256 '04221d92edb5f6dfd59a859f070d01e6fb281ade170bb54de176e24779b3556d'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.1-mac-9.0.1/emacs-28.1-mac-9.0.1-11.6.5-spacemacs-icon.zip'
    end
  else
    if MacOS.version <= :big_sur
      sha256 '00811da1b69f7edef017c3c28db8decf3e19ed4039829aa6239aeaefbb0ee106'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.1-mac-9.0/emacs-28.1-mac-9.0-arm64-11.6.5-spacemacs-icon.zip'
    else
      # for macOS version is or newer than Big Sur
      # elsif MacOS.version <= :monterey # reserved for later
      sha256 'd23fe977de07b7fd52efb42f076c19a1132e43097d4d23dbaa878af718a9ccff'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.1-mac-9.0.1/emacs-28.1-mac-9.0.1-arm64-12.3.1-spacemacs-icon.zip'
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
