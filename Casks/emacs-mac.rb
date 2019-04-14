cask 'emacs-mac' do
  version 'emacs-26.2-z-mac-7.6'

  if MacOS.version >= :mojave
    sha256 '81e3ee9d86ad22c2784a0a5086c87a09226cd037a8bd58e2681607ab2b554018'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-mac-7.6/emacs-26.2-mac-7.6-10.14.3.zip'
  elsif MacOS.version == :high_sierra
    sha256 'b551f358f50ff720020f5f74211392976165ed9e7d01648ce6885d01fc052cc3'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-mac-7.6/emacs-26.2-mac-7.6-10.13.6.zip'
  else
    sha256 '58bafd25b255440adc424aa4ef92702fb049a20ebf259178b89d56f7b5df91da'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-mac-7.6/emacs-26.2-mac-7.6-10.12.6.zip'
  end

  appcast 'https://github.com/railwaycat/homebrew-emacsmacport/releases.atom'
  name 'Emacs-mac'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  conflicts_with cask: [
                        'emacs',
                        'emacs-mac-snapshot',
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
