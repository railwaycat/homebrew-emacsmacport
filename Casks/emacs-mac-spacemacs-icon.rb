cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-28.1-mac-9.0'

  if Hardware::CPU.intel?
    if MacOS.version <= :mojave
      odie "Because of the limitation of build system, there is no cask support for mojave(10.14) and earlier, please build from Homebrew formula."
    elsif MacOS.version <= :catalina
      sha256 '832e1b9384730cc5ff2ce018a979aec82699a7a13c9bd18f84649a39644d50ac'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.1-mac-9.0/emacs-28.1-mac-9.0-10.15.7-spacemacs-icon.zip'
    else
      # for macOS version is or newer than Big Sur
      # elsif MacOS.version <= :big_sur # reserved for later
      sha256 '2f412038d391ed663d3731c792ca586ae439d3442ed71f5a2719c3d635c1cbc2'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.1-mac-9.0/emacs-28.1-mac-9.0-11.6.5-spacemacs-icon.zip'
    end
  else
    if MacOS.version <= :big_sur
      sha256 '00811da1b69f7edef017c3c28db8decf3e19ed4039829aa6239aeaefbb0ee106'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.1-mac-9.0/emacs-28.1-mac-9.0-arm64-11.6.5-spacemacs-icon.zip'
    else
      # for macOS version is or newer than Big Sur
      # elsif MacOS.version <= :monterey # reserved for later
      sha256 '89e28630ceb651824cb4df5a661e1c015fe511a0569ba1006f8af5868c9577a6'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.1-mac-9.0/emacs-28.1-mac-9.0-arm64-12.3.1-spacemacs-icon.zip'
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
