cask 'emacs-mac-28' do
  version 'emacs-28.3-rc1-mac-9.2'

  if Hardware::CPU.intel?
    depends_on macos: ">= :ventura" # macOS 13
    sha256 '1ba349eb63edb0345c9514b76b1460023d0b59c118459f9f5e577be523d44d89'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.3-rc1-mac-9.2/emacs-28.3-rc1-mac-9.2-x86_64-13.7.6.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
  else # Apple Silicon
    depends_on macos: ">= :sonoma" # macOS 14

    if MacOS.version >= :sequoia # macOS 15
      # for macOS is or newer than 15
      sha256 '72e02759cc33334b5c897d2731f26f3cf81af9fc0985051c0e9274f3c9e471c8'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.3-rc1-mac-9.2/emacs-28.3-rc1-mac-9.2-arm64-15.5.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
    else
      # for macOS older than 15, which is 14
      sha256 '033c4d13ff16b408f8fa49cd021804eda1aa3db6e13d3f35ef67b9f63f425269'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.3-rc1-mac-9.2/emacs-28.3-rc1-mac-9.2-arm64-14.7.6.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
    end
  end

  name 'Emacs-mac v28'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'
  desc "YAMAMOTO Mitsuharu's Mac port of GNU Emacs"

  conflicts_with cask: [
                        'emacs',
                        'emacs-mac',
                        'emacs-mac-spacemacs-icon',
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
