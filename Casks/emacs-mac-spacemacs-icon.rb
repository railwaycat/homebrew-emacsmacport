cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-26.3-z-mac-7.9'

  if MacOS.version >= :mojave
    sha256 '724d3701a81aca885ce6d90e115006d216dbb7980e37c4e6906f86fd70b4d20f'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.9/emacs-26.3-mac-7.9-10.14.4-spacemacs-icon.zip'
  else
    sha256 'e9b454a63c91fe3f369b5c3a7f469dd9d0cb7938b3adbefd63fd2a9cc8f58bdc'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.9/emacs-26.3-mac-7.9-10.13.6-spacemacs-icon.zip'
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
