cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-26.1-z-mac-7.2'

  if MacOS.version >= :mojave
    sha256 '1dbfbe8b34c5b866f65deaba18f996577725af4ad9c685f819cb795f6f088021'
    url 'https://s3.amazonaws.com/emacs-mac-port/emacs-26.1-mac-7.2-10.14-spacemacs-icon.zip'
  else
    sha256 '2cad2949bf6dec4a44f806089e0827474b00e50ea3dd1ef97e516ab66e45b025'
    url 'https://s3.amazonaws.com/emacs-mac-port/emacs-26.1-mac-7.2-10.9-spacemacs-icon.zip'
	end

  name 'Emacs-mac with spacemacs icon'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  conflicts_with cask: [
                        'emacs',
                        'emacs-mac'
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
