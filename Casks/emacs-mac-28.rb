cask 'emacs-mac-28' do
  version 'emacs-28.2-mac-9.1'

  if Hardware::CPU.intel?
    depends_on macos: ">= :big_sur"

    if MacOS.version <= :big_sur
      sha256 '6a62f75894475fa3d9474cb5b7a9a596c5c5466b94398687b8a71d84fc3af6d8'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.2-mac-9.1/emacs-28.2-mac-9.1-11.6.8.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
    else
      # for macOS version is or newer than Monterey
      sha256 '484690f89fceaa03f686b38bff6c12f462bf26e1e8d61283fe22df30d1481482'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.2-mac-9.1/emacs-28.2-mac-9.1-12.6.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
    end
  else # Apple Silicon
    depends_on macos: ">= :monterey"

    # for macOS version is or newer than Monterey
    sha256 '488a1bf68a87a3dd304a25f2a1fe2f0b4ae95c2c80bfe4e53bdbeff0e3a2c5d4'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.2-mac-9.1/emacs-28.2-mac-9.1-arm64-12.5.1.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
  end

  name 'Emacs-mac v28'
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
