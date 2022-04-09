cask 'emacs-mac' do
  version 'emacs-28.1-mac-9.0'

  if Hardware::CPU.intel?
    if MacOS.version <= :mojave
      odie "Because of the limitation of build system, there is no cask support for Mojave(10.14) and earlier, please build from Homebrew formula."
    elsif MacOS.version <= :catalina
      sha256 'ae8cc8649d038c6ce8d27e92631a19c8f168c1b6d78c15837577468a7681395a'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.1-mac-9.0/emacs-28.1-mac-9.0-10.15.7.zip'
    else
      # for macOS version is or newer than Big Sur
      # elsif MacOS.version <= :big_sur # reserved for later
      sha256 'a3763e2b039fb8535e02a73a56a197ff5993c16fab8c75e3ff41ebea23e41073'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.1-mac-9.0/emacs-28.1-mac-9.0-11.6.5.zip'
    end
  else
    if MacOS.version <= :big_sur
      sha256 '7250d73194b82ea185041913b999304980c39218d14f4f98b056beed9ef4fdcf'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.1-mac-9.0/emacs-28.1-mac-9.0-arm64-11.6.5.zip'
    else
      # for macOS version is or newer than Big Sur
      # elsif MacOS.version <= :monterey # reserved for later
      sha256 'c6fb1575bd27adabbf85234bc223ff98300391ea23dab73da4a240947416d72b'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.1-mac-9.0/emacs-28.1-mac-9.0-arm64-12.3.1.zip'
  end

  appcast 'https://github.com/railwaycat/homebrew-emacsmacport/releases.atom'
  name 'Emacs-mac'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'
  desc "YAMAMOTO Mitsuharu's Mac port of GNU Emacs"

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
