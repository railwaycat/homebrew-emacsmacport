cask 'emacs-mac' do
  version 'emacs-26.3-z-mac-7.7'

  if MacOS.version >= :mojave
    sha256 'b386a1c31ee9b7e2bca48be61ed099bec4b85c8fcbaddc8ead3a55d69b3c8488'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.7/emacs-26.3-mac-7.7-10.14.4.zip'
  elsif MacOS.version == :high_sierra
    sha256 '4f9180a258f45f6989f5baf411a196c403d8ab3c34a1ba6cc2ec833b67b4ed3f'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.7/emacs-26.3-mac-7.7-10.13.6.zip'
  else
    sha256 'cd0a4960164ca1449d73c93762f35efaca6025ca022bdd7d4b63db001ec2eb55'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.7/emacs-26.3-mac-7.7-10.12.6.zip'
  end

  appcast 'https://github.com/railwaycat/homebrew-emacsmacport/releases.atom'
  name 'Emacs-mac'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  conflicts_with cask: [
                        'emacs',
                        'emacs-mac-spacemacs-icon',
                       ],
                 formula: [
                        'emacs',
                        'ctags'
                       ]

  app 'Emacs.app'
  binary "#{appdir}/Emacs.app/Contents/MacOS/Emacs.sh", target: 'emacs'
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/ctags"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/ebrowse"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/emacsclient"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/etags"

  zap trash: [
               '~/Library/Caches/org.gnu.Emacs',
               '~/Library/Preferences/org.gnu.Emacs.plist',
               '~/Library/Saved Application State/org.gnu.Emacs.savedState',
             ]

end
