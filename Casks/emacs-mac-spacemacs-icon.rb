cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-27.2-mac-8.3'

  if Hardware::CPU.intel?
    if MacOS.version <= :high_sierra
      odie "Because of the limitation of build system, there is no cask support for High Sierra(10.13) and earlier, please build from Homebrew formula."
    elsif MacOS.version <= :mojave
      sha256 '30fb8ad8114fc61942ea7c1222029c9a81484ca8e9d134ea8623e772e03ed350'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.2-mac-8.3/emacs-27.2-mac-8.3-10.14.6-spacemacs-icon.zip'
    elsif MacOS.version <= :catalina
      sha256 '8eb1c1eb7a740322edacd4197ed1cff9264c1527a09ea30250409128d32a33e2'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.2-mac-8.3/emacs-27.2-mac-8.3-10.15.7-spacemacs-icon.zip'
    else
      # for macOS version is or newer than Big Sur
      # elsif MacOS.version <= :big_sur # reserved for later
      sha256 '5ba1e2e8c230f1d98c9f855bc055593b62d54f4b84d49814f313ce28fddfe08d'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.2-mac-8.3/emacs-27.2-mac-8.3-11.6.1-spacemacs-icon.zip'
    end
  else
    # Arm Macs should be running macOS >= Big Sur(11), let's add the version check in the future when necessary.
    sha256 '16682979f9a14ccd40048f7e3dd0c7793d03c680e4f654ec0f0e06a7068eddc3'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.2-mac-8.3/emacs-27.2-mac-8.3-11.6.1-arm64-spacemacs-icon.zip'
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
