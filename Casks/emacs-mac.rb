cask 'emacs-mac' do
  version 'emacs-29.1-mac-10.0'

  if Hardware::CPU.intel?
    depends_on macos: ">= :big_sur"

    if MacOS.version <= :big_sur
      sha256 'f2f7f8230cb9db9db24fde1cde07928a99c05eb8d949662e761fe04cce029ca7'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-29.1-mac-10.0/emacs-29.1-mac-10.0-x86_64-11.7.8.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
    else
      # for macOS version is or newer than Monterey
      sha256 'ac86abc88d66000bf92c845664d643f1c5f3595da9a328366952683e070d0d55'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-29.1-mac-10.0/emacs-29.1-mac-10.0-x86_64-12.6.7.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
    end
  else # Apple Silicon
    depends_on macos: ">= :monterey"

    if MacOS.version <= :monterey
      sha256 '5224bb69e1f36d52284f22368507664096d7ab2cec360b370f08c29e0f3a9000'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-29.1-mac-10.0/emacs-29.1-mac-10.0-arm64-12.5.1.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
    else
      # for macOS version is or newer than ventura
      sha256 '0caf0dd36115a2b648abc94ce715ca844071ced0ff6bac6dbed5c1d2fa66df24'
      url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-29.1-mac-10.0/emacs-29.1-mac-10.0-arm64-13.4.zip', verified: "github.com/railwaycat/homebrew-emacsmacport"
    end
  end

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
