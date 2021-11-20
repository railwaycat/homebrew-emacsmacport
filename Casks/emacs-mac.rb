cask 'emacs-mac' do
  version 'emacs-27.2-mac-8.3.1'

  if Hardware::CPU.intel?
    if MacOS.version <= :high_sierra
      odie "Because of the limitation of build system, there is no cask support for High Sierra(10.13) and earlier, please build from Homebrew formula."
    elsif MacOS.version <= :mojave
      sha256 '6cca77eab9d1f2e2533eda8ba139e3581dca3af6c24c906912c8f8aefb939d87'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.2-mac-8.3/emacs-27.2-mac-8.3-10.14.6.zip'
    elsif MacOS.version <= :catalina
      sha256 'ec393d8d69ae80dec8500312c0eb5dccfe6c0b1e08d4dc4b0094b98b2568b275'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.2-mac-8.3/emacs-27.2-mac-8.3-10.15.7.zip'
    else
      # for macOS version is or newer than Big Sur
      # elsif MacOS.version <= :big_sur # reserved for later
      sha256 'be3d78cfb715ee8ca811374cf65838e0e59d0840477d2d304889dabb7206cbd0'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.2-mac-8.3/emacs-27.2-mac-8.3-11.6.1.zip'
    end
  else
    # Arm Macs should be running macOS >= Big Sur(11), let's add the version check in the future when necessary.
    sha256 '7b314e6bee8795221707267e5e95c70459b1ac97460077337bdd76b9702930e3'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.2-mac-8.3.1/emacs-27.2-mac-8.3.1-arm64-11.6.1.zip'
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
