cask 'emacs-mac' do
  version 'emacs-26.2-z-mac-7.6.1'

  if MacOS.version >= :mojave
    sha256 'd759f033df4d428a5445826f533aeb01cb0055f421bcb43b97adba98bdf5de3e'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-mac-7.6.1/emacs-26.2-mac-7.6.1-10.14.4.zip'
  elsif MacOS.version == :high_sierra
    sha256 'ff9be62cea4f3701a85e3b7750d2533fa5cd26a3b709ddd0bbe54cdce8c043d6'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-mac-7.6.1/emacs-26.2-mac-7.6.1-10.13.6.zip'
  else
    sha256 'cfa9f3c76222cee7ee8cc055cc6e270391ac8fb2fc8210f80a5dedbbfac94cf1'
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
