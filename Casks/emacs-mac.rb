cask 'emacs-mac' do
  version 'emacs-29.4-mac-10.1'

  if Hardware::CPU.intel?
    depends_on macos: ">= :ventura"

    sha256 '412516bec8d5561163c868874b452c7275aa903617df252cf6a287289b6d7fe3'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-29.4-mac-10.1/emacs-29.4-mac-10.1-x86_64-13.7.6.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
  else # Apple Silicon
    depends_on macos: ">= :ventura"

    if MacOS.version >= :sequoia # macOS 15
      # for macOS is or newer than 15
      sha256 'e673ce675cbc44047eb27857171be554e3aa938fcadce9bd5f411f722b735b22'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-29.4-mac-10.1/emacs-29.4-mac-10.1-arm64-15.5.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
    else
      # for macOS older than 15, which is 14
      sha256 'f4f18e78297e6a1e0dc69bb4ce91496aa7249f0a92679665deb5e7e405ca1fbd'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-29.4-mac-10.1/emacs-29.4-mac-10.1-arm64-14.7.6.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
    end
  end

  name 'Emacs-mac'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'
  desc "YAMAMOTO Mitsuharu's Mac port of GNU Emacs"

  conflicts_with cask: [
                        'emacs',
                        'emacs-mac-spacemacs-icon',
                        'emacs-mac-28',
                        'emacs-mac-28-spacemacs-icon',
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
