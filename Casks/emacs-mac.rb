cask 'emacs-mac' do
  version 'emacs-26.3-rc1-mac-7.7'

  if MacOS.version >= :mojave
    sha256 '6b261d584c910fb6bfd833cdfa3d15eb0f3b0e4ba7fad0b4673c6a906b65b230'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-rc1-mac-7.7/emacs-26.3-rc1-mac-7.7-10.14.4.zip'
  elsif MacOS.version == :high_sierra
    sha256 '84b53969c6ba4e02c8f349e474218a97450e47faddd0f23e111ac01a189b96f8'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-rc1-mac-7.7/emacs-26.3-rc1-mac-7.7-10.13.6.zip'
  else
    sha256 '8deba6f1426ec6d2fa8d5c9af0a5c0fd3a8f7e993b482990e45d2c5cdfdcdc4c'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-rc1-mac-7.7/emacs-26.3-rc1-mac-7.7-10.12.6.zip'
  end

  appcast 'https://github.com/railwaycat/homebrew-emacsmacport/releases.atom'
  name 'Emacs-mac'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  conflicts_with cask: [
                        'emacs',
                        'emacs-mac-spacemacs-icon',
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
