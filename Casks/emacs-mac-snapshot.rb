cask 'emacs-mac-snapshot' do
  version 'emacs-mac-a605292'

  if MacOS.version >= :mojave
    sha256 'c48c12b9fce51d3eb20265d8b9d91db0cc11fa8c7968695e00f0fc6370d99d86'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-rc1-mac-7.5/emacs-26.2-rc1-mac-7.5-10.14.3.zip'
  elsif MacOS.version == :high_sierra
    sha256 '1761ec15f9739d6f96e64f905f990d04b35bfbbdb844d82ff9cc5038436fe9ae'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-rc1-mac-7.5/emacs-26.2-rc1-mac-7.5-10.13.6.zip'
  else
    sha256 'f791401be693b00eb27db33bbccfb55d4b238ba9ecdbaf29bdca56657ae687f7'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-rc1-mac-7.5/emacs-26.2-rc1-mac-7.5-10.12.6.zip'
  end

  appcast 'https://github.com/railwaycat/homebrew-emacsmacport/releases.atom'
  name 'Emacs-mac-snapshot'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  conflicts_with cask: [
                        'emacs',
                        'emacs-mac',
                        'emacs-mac-spacemacs-icon',
                        'emacs-mac-spacemacs-icon-snapshot'
                       ]

  app 'Emacs.app'
  binary "#{appdir}/Emacs.app/Contents/MacOS/Emacs", target: 'emacs'
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/ebrowse"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/emacsclient"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/etags"

  zap trash: [
               '~/Library/Caches/org.gnu.Emacs',
               '~/Library/Preferences/org.gnu.Emacs.plist',
               '~/Library/Saved Application State/org.gnu.Emacs.savedState',
             ]

end
