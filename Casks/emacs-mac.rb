cask 'emacs-mac' do
  version 'emacs-26.2-z-mac-7.6.1'

  if MacOS.version >= :mojave
    sha256 '26455fcda7a045ef9285df3634c9a69239a709c78608ac2087513a5b0e1578a6'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-mac-7.6.1/emacs-26.2-mac-7.6.1-10.14.3.zip'
  elsif MacOS.version == :high_sierra
    sha256 '72416a2d3e505e023d296a5eabff058644ccde5100f3a5e4c12d588aa6a9874e'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-mac-7.6.1/emacs-26.2-mac-7.6.1-10.13.6.zip'
  else
    sha256 '6ee10e2dd43244ad65f1512fae159e25f6e0cb66d0a93cd7638c29a06446a810'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-mac-7.6.1/emacs-26.2-mac-7.6.1-10.12.6.zip'
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
