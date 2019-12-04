cask 'emacs-mac' do
  version 'emacs-26.3-z-mac-7.8'

  if MacOS.version >= :mojave
    sha256 '161d27e44e2e0863feb5a935d5acc7bf08d676c56370208070b1b5bcdbebd701'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.8/emacs-26.3-mac-7.8-10.14.4.zip'
  elsif MacOS.version == :high_sierra
    sha256 'b36016ae17824f3a3c53a2e35402b9768d5e269a57d22bf774dfb2d5eee5c085'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.8/emacs-26.3-mac-7.8-10.13.6.zip'
  else
    sha256 '46dfe61d6c0352f02c5e29446fba9a5d0380f0113f0689366e4cee6bd1aab101'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.8/emacs-26.3-mac-7.8-10.12.6.zip'
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
