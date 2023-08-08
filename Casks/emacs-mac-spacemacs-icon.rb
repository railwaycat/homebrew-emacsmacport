cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-29.1-mac-10.0'

  if Hardware::CPU.intel?
    depends_on macos: ">= :big_sur"

    if MacOS.version <= :big_sur
      sha256 '7f8f4923c38fefcb18ebb5922fb983bcca3b6328c75f6f8812787a7cdf77b9ee'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-29.1-mac-10.0/emacs-29.1-mac-10.0-x86_64-11.7.8-spacemacs-icon.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
    else
      # for macOS version is or newer than Big Sur
      sha256 '0d724e7bcd67ac8b16c50055df033220ffba570bd669ae209769d63e3dbe2a59'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-29.1-mac-10.0/emacs-29.1-mac-10.0-x86_64-12.6.7-spacemacs-icon.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
    end
  else # Apple Silicon
    depends_on macos: ">= :monterey"

    if MacOS.version <= :monterey
      sha256 'dd3caddf159e855395abfa60561833af8bbb436354a27cd25df44b2b737da494'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-29.1-mac-10.0/emacs-29.1-mac-10.0-arm64-12.5.1-spacemacs-icon.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
    else
      # for macOS version is or newer than Monterey
      sha256 'd47dddbf74a15d509a8217ed27a1a51bc9f19a35e7554d14dcdc7fbf4cb65f3e'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-29.1-mac-10.0/emacs-29.1-mac-10.0-arm64-13.4-spacemacs-icon.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
    end
  end

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
  manpage "#{appdir}/Emacs.app/Contents/Resources/man/man1/ebrowse.1.gz"
  manpage "#{appdir}/Emacs.app/Contents/Resources/man/man1/emacs.1.gz"
  manpage "#{appdir}/Emacs.app/Contents/Resources/man/man1/emacsclient.1.gz"
  manpage "#{appdir}/Emacs.app/Contents/Resources/man/man1/etags.1.gz"

  zap trash: [
               '~/Library/Caches/org.gnu.Emacs',
               '~/Library/Preferences/org.gnu.Emacs.plist',
               '~/Library/Saved Application State/org.gnu.Emacs.savedState',
             ]

end
