cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-26.3-rc1-mac-7.7'

  if MacOS.version >= :mojave
    sha256 'acf9a58bb99cb98b306e5d176ef43e3f5c41909c443e969b39d218526d78a9ae'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-rc1-mac-7.7/emacs-26.3-rc1-mac-7.7-10.14.4-spacemacs-icon.zip'
  elsif MacOS.version == :high_sierra
    sha256 '1036c507801c0696dfe60f26cbbf26eab60fb7e98b6320f9f9bcbb33d16c7b4b'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-rc1-mac-7.7/emacs-26.3-rc1-mac-7.7-10.13.6-spacemacs-icon.zip'
  else
    sha256 '632c7ec089432c4d5c3d458d21d5c37e037b786a4663cdd66cce06012b0498bc'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.3-rc1-mac-7.7/emacs-26.3-rc1-mac-7.7-10.12.6-spacemacs-icon.zip'
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
