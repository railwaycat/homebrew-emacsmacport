cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-26.2-z-mac-7.6.1'

  if MacOS.version >= :mojave
    sha256 '32ce533ae42026400ec080357e3a7c67a12c1a95df6c7fbfa8ffc45bc224de49'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-mac-7.6.1/emacs-26.2-mac-7.6.1-10.14.4-spacemacs-icon.zip'
  elsif MacOS.version == :high_sierra
    sha256 '4af4bba2a03922bbfc467cf353d3ee51e9846c939753978aec4dcff38152133f'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-mac-7.6.1/emacs-26.2-mac-7.6.1-10.13.6-spacemacs-icon.zip'
  else
    sha256 '94223b244a5e0a262f23dd1cd67113924a7ff3201b7edddb5a09045ff2f6e89e'
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
