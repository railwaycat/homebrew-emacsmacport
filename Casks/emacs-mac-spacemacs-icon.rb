cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-26.2-rc1-mac-7.5'

  if MacOS.version >= :mojave
    sha256 '92ac5c72a2561d0f4e1a81acaec49cade108c6cc472897da2cc883f9ea5706cb'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-rc1-mac-7.5/emacs-26.2-rc1-mac-7.5-10.14.3-spacemacs-icon.zip'
  elsif MacOS.version == :high_sierra
    sha256 'a5b76a439cd7ce6bd3ba9552b88a1e5279ccd7fac720fd02fa3d62a459d83d21'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-rc1-mac-7.5/emacs-26.2-rc1-mac-7.5-10.13.6-spacemacs-icon.zip'
  else
    sha256 '62f865ccf18328ac68bcca74b62d53af035a480e0a772585f7eeffe1605f1dcf'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-rc1-mac-7.5/emacs-26.2-rc1-mac-7.5-10.12.6-spacemacs-icon.zip'
  end

  appcast 'https://github.com/railwaycat/homebrew-emacsmacport/releases.atom'
  name 'Emacs-mac with spacemacs icon'
  homepage 'https://bitbucket.org/mituharu/emacs-mac.git'

  conflicts_with cask: [
                        'emacs',
                        'emacs-mac',
                        'emacs-mac-snapshot',
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
