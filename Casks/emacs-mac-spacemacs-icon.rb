cask 'emacs-mac-spacemacs-icon' do
  version 'emacs-26.2-z-mac-7.6'

  if MacOS.version >= :mojave
    sha256 'a88bd208c0079db887da34b7f4b6b517076d8239d11a58936be91d919d4af399'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-mac-7.6/emacs-26.2-mac-7.6-10.14.3-spacemacs-icon.zip'
  elsif MacOS.version == :high_sierra
    sha256 'b9e4a9b692c84dfb3082c7be45afcdbb157b471182d58e40d2a7f16977bcf84e'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-mac-7.6/emacs-26.2-mac-7.6-10.13.6-spacemacs-icon.zip'
  else
    sha256 'c13c6930f3cfe910c1f744ac452af47603e2e187dbf2452a484ea327d15599ed'
    url 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-26.2-mac-7.6/emacs-26.2-mac-7.6-10.12.6-spacemacs-icon.zip'
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
