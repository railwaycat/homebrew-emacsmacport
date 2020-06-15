cask 'emacs-mac' do
  version 'emacs-26.3-z-mac-7.9.1'

  if MacOS.version >= :mojave
    sha256 '8f105d20ee0d7b3f0b8afd5b5bf1f9afff0dc5bdd51969f1cc34866053739952'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.9.1/emacs-26.3-mac-7.9-10.14.6.zip'
  else
    sha256 'e86a56a1648483496c7409c483977d115d8c2a43b0733a4712f790085cb00367'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.9.1/emacs-26.3-mac-7.9-10.13.6.zip'
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
