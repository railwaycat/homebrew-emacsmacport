cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-29.4-mac-10.1'

  if Hardware::CPU.intel?
    depends_on macos: ">= :ventura"

    sha256 '79f1406d98c341114b90be5eecca93a69d6a07b87533351b0b8fb792906b33a4'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-29.4-mac-10.1/emacs-29.4-mac-10.1-x86_64-13.7.6-spacemacs-icon.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
  else # Apple Silicon
    depends_on macos: ">= :ventura"

    if MacOS.version >= :sequoia # macOS 15
      # for macOS is or newer than 15
      sha256 'a74503eef9df69a6a647d602b3b618eb85c4820b9e135413cf5278bd7c04d84b'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-29.4-mac-10.1/emacs-29.4-mac-10.1-arm64-15.5-spacemacs-icon.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
    else
      # for macOS older than 15, which is 14
      sha256 '809e5993a22a424a9293e3da33cb182ffd6b8f375c75a400cb7b95da05a1bb19'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-29.4-mac-10.1/emacs-29.4-mac-10.1-arm64-14.7.6-spacemacs-icon.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
    end
  end

  name 'Emacs-mac with spacemacs icon'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'
  desc "YAMAMOTO Mitsuharu's Mac port of GNU Emacs"

  conflicts_with cask: [
                        'emacs',
                        'emacs-mac',
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
