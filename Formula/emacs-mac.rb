require 'formula'

class EmacsMac < Formula
  homepage 'http://www.gnu.org/software/emacs/'

  head 'https://github.com/railwaycat/emacs-mac-port.git'
  url 'https://github.com/railwaycat/emacs-mac-port.git', :using => :git, :tag => 'v4.8'
  version 'emacs-24.3-mac-4.8'

  depends_on 'automake'
  depends_on 'pkg-config' => :build

  option 'with-dbus', 'Build with d-bus support'
  option 'with-xml2', 'Build with libxml2 support'
  option "keep-ctags", "Don't remove the ctags executable that emacs provides"
  option "icon-official", "Using offical Emacs icon"
  option "icon-modern", "Using a modern style Emacs icon by @tpanum"

  depends_on 'd-bus' if build.include? 'with-dbus'
  depends_on 'gnutls' => :optional
  depends_on 'imagemagick' => :optional
  depends_on 'libxml2' if build.include? 'with-xml2'

  def caveats
    s = ""
    s += <<-EOS.undent

      This is YAMAMOTO Mitsuharu's experimental "Mac port" addition to
      GNU Emacs 24. This provides a native GUI support for Mac OS X
      10.4 - 10.9. After installing, see README-mac and NEWS-mac
      in #{prefix} for the port details.

    EOS

    s += <<-EOS.undent
        Emacs.app was installed to:
          #{prefix}

        To link the application to default Homebrew App location:
          brew linkapps
        or:
          ln -s #{prefix}/Emacs.app /Applications

        For a CLI starter, please look at:
          https://gist.github.com/4043945

        To install info files under share/info, an environment variable
        need been set before install. Read more: man brew.
          export HOMEBREW_KEEP_INFO=1

    EOS

    return s
  end

  # Follow Homebrew and don't install ctags from Emacs. This allows Vim
  # and Emacs and exuberant ctags to play together without violence.
  def do_not_install_ctags
    unless build.include? "keep-ctags"
      (bin/"ctags").unlink
      (share/man/man1/"ctags.1.gz").unlink
    end
  end

  def install
    args = ["--prefix=#{prefix}",
            "--enable-locallisppath=#{HOMEBREW_PREFIX}/share/emacs/site-lisp",
            "--infodir=#{info}/emacs",
            "--with-mac",
            "--enable-mac-app=#{prefix}"]

    # icons
    icon_path = "./mac/Emacs.app/Contents/Resources/"
    if build.include? "icon-official"
      system "rm -f "+icon_path+"Emacs.icns"
      system "cp " +icon_path+"Emacs.icns.official "+icon_path+"Emacs.icns"
    elsif build.include? "icon-modern"
      system "rm -f "+icon_path+"Emacs.icns"
      system "cp " +icon_path+"Emacs.icns.modern "+icon_path+"Emacs.icns"
    end
    
    # build
    system "./configure", *args
    system "make"
    system "make install"

    # Don't cause ctags clash.
    do_not_install_ctags
  end
end
