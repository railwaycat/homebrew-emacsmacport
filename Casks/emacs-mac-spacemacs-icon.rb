cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-26.3-z-mac-7.7'

  if MacOS.version >= :mojave
    sha256 '507abca7eed2400a4f7ed135e9631c28b288091096cd1edaf8d4b00c46e8457a'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.7/emacs-26.3-mac-7.7-10.14.4-spacemacs-icon.zip'
  elsif MacOS.version == :high_sierra
    sha256 'b48df51ea637f42f4ab8abc24cafa4e179f26cb8cb84e97023a3257905d1ca4e'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.7/emacs-26.3-mac-7.7-10.13.6-spacemacs-icon.zip'
  else
    sha256 '27a95ab605ba096bffc8b75e3c9f84f8b0045e3a7ee43dd635966cdafb5eaee1'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-mac-7.7/emacs-26.3-mac-7.7-10.12.6-spacemacs-icon.zip'
  end

  appcast 'https://github.com/railwaycat/homebrew-emacsmacport/releases.atom'
  name 'Emacs-mac with spacemacs icon'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  conflicts_with cask: [
                        'emacs',
                        'emacs-mac',
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
