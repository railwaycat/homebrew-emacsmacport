cask 'emacs-mac-28-spacemacs-icon' do
  version 'emacs-28.3-rc1-mac-9.2'

  if Hardware::CPU.intel?
    depends_on macos: ">= :ventura" # macOS 13
    sha256 '368841421adff600c3941fcd94bd32532a005ce65ec56bf2834df97d73f28b85'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.3-rc1-mac-9.2/emacs-28.3-rc1-mac-9.2-x86_64-13.7.6-spacemacs-icon.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
  else # Apple Silicon
    depends_on macos: ">= :sonoma" # macOS 14

    if MacOS.version >= :sequoia # macOS 15
      # for macOS is or newer than 15
      sha256 'daf8426db67a3cd15529145bc1218e89639cb467ba7b2fbac35e33bf3312655e'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.3-rc1-mac-9.2/emacs-28.3-rc1-mac-9.2-arm64-15.5-spacemacs-icon.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
    else
      # for macOS older than 15, which is 14
      sha256 '41dd24b5773692f06bee153c065cc3a2e8c14bfb926b4e99488df69e41a8597f'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.3-rc1-mac-9.2/emacs-28.3-rc1-mac-9.2-arm64-14.7.6-spacemacs-icon.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
    end
  end

  name 'Emacs-mac v28 with spacemacs icon'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'
  desc "YAMAMOTO Mitsuharu's Mac port of GNU Emacs"

  conflicts_with cask: [
                        'emacs',
                        'emacs-mac',
                        'emacs-mac-spacemacs-icon',
                        'emacs-mac-28',
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
