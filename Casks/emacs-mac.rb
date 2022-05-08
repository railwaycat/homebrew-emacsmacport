cask 'emacs-mac' do
  version 'emacs-28.1-mac-9.0.1'

  if Hardware::CPU.intel?
    if MacOS.version <= :mojave
      odie "Because of the limitation of build system, there is no cask support for Mojave(10.14) and earlier, please build from Homebrew formula."
    elsif MacOS.version <= :catalina
      sha256 'dd49a5685e335268403fd0ab99c86809029c5cdd9f93ef6560596b9487b28c6d'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.1-mac-9.0.1/emacs-28.1-mac-9.0.1-10.15.7.zip'
    else
      # for macOS version is or newer than Big Sur
      # elsif MacOS.version <= :big_sur # reserved for later
      sha256 '5b23fd090421ab77e5580274fb70316d3f1a760da06c87f706d18ca4971fb95d'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.1-mac-9.0.1/emacs-28.1-mac-9.0.1-11.6.5.zip'
    end
  else
    if MacOS.version <= :big_sur
      sha256 '7250d73194b82ea185041913b999304980c39218d14f4f98b056beed9ef4fdcf'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.1-mac-9.0/emacs-28.1-mac-9.0-arm64-11.6.5.zip'
    else
      # for macOS version is or newer than Big Sur
      # elsif MacOS.version <= :monterey # reserved for later
      sha256 'f76dfe76131d26d76a4a34a89487fd01388ccf5d1b35744b05d5f0aa361ff8bf'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-28.1-mac-9.0.1/emacs-28.1-mac-9.0.1-arm64-12.3.1.zip'
    end
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
