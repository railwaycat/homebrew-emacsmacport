cask 'emacs-mac' do
  version 'emacs-26.3-z-mac-7.9'

  if MacOS.version >= :mojave
    sha256 '47a4d542bcbdc9d97bbd49d0482e663370e5c584fd43ac6ca7a0fa29625c68da'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.9/emacs-26.3-mac-7.9-10.14.4.zip'
  else
    sha256 '6027df79425f334ff2a2aa943bcafc01f8f3faa5bae2b63fecfa641c963d3045'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.9/emacs-26.3-mac-7.9-10.13.6.zip'
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
