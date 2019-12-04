cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-26.3-z-mac-7.8'

  if MacOS.version >= :mojave
    sha256 '1505709c574205daa36a06075b6e53bdc3c5060f3aae5f1a2fe299b6502568b3'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.8/emacs-26.3-mac-7.8-10.14.4-spacemacs-icon.zip'
  elsif MacOS.version == :high_sierra
    sha256 '0eabbb47e8a8e089402ae959dffbe31d2b75d441df0b7244bba9494db8183642'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.8/emacs-26.3-mac-7.8-10.13.6-spacemacs-icon.zip'
  else
    sha256 '3405daceb9ec97f1c6f31b9b6f9e48b1ca363e89fd1a25e769bdbb428e23d4e8'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.8/emacs-26.3-mac-7.8-10.12.6-spacemacs-icon.zip'
  end

  appcast 'https://github.com/railwaycat/homebrew-emacsmacport/releases.atom'
  name 'Emacs-mac with spacemacs icon'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  conflicts_with cask: [
                        'emacs',
                        'emacs-mac',
                       ]

  app 'Emacs.app'
  binary "#{appdir}/Emacs.app/Contents/MacOS/Emacs.sh", target: 'emacs'
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/ebrowse"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/emacsclient"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/etags"

  zap trash: [
               '~/Library/Caches/org.gnu.Emacs',
               '~/Library/Preferences/org.gnu.Emacs.plist',
               '~/Library/Saved Application State/org.gnu.Emacs.savedState',
             ]

end
