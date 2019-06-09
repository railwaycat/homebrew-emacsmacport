cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-26.2-z-mac-7.6.1'

  if MacOS.version >= :mojave
    sha256 '4548db2dfc58af3f3a919a62cd99266dd23342e3359aaa5801b3c5f397c93fd4'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-mac-7.6.1/emacs-26.2-mac-7.6.1-10.14.3-spacemacs-icon.zip'
  elsif MacOS.version == :high_sierra
    sha256 '9b333b5787cd6ad7ef679bbe504a3c00d1ef814daed0d799122fa1ab5f001496'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-mac-7.6.1/emacs-26.2-mac-7.6.1-10.13.6-spacemacs-icon.zip'
  else
    sha256 'ed6f6540828dd931b622acf007085229bf94fd092aaee690ae793723db4a7be7'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-mac-7.6.1/emacs-26.2-mac-7.6.1-10.12.6-spacemacs-icon.zip'
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
