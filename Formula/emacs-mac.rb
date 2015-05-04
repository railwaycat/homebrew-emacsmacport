class EmacsMac < Formula
  homepage "https://www.gnu.org/software/emacs/"

  head "http://www.math.s.chiba-u.ac.jp/~mituharu/emacs-mac.git"
  url "http://www.math.s.chiba-u.ac.jp/~mituharu/emacs-mac.git", :revision => "emacs-24.5-mac-5.7"
  version "emacs-24.5-z-mac-5.7"

  depends_on :autoconf => :build
  depends_on :automake => :build
  depends_on "pkg-config" => :build

  option "with-dbus", "Build with d-bus support"
  option "with-xml2", "Build with libxml2 support"
  option "with-ctags", "Don't remove the ctags executable that emacs provides"
  option "with-official-icon", "Using offical Emacs icon"
  option "with-modern-icon", "Using a modern style Emacs icon by @tpanum"
  option "with-spacemacs-icon", "Using the spacemacs Emacs icon by Nasser Alshammari"

  deprecated_option "keep-ctags" => "with-ctags"
  deprecated_option "icon-official" => "with-official-icon"
  deprecated_option "icon-modern" => "with-modern-icon"

  depends_on "d-bus" if build.with? "dbus"
  depends_on "glib" => :optional
  depends_on "gnutls" => :optional
  depends_on "imagemagick" => :optional
  depends_on "libxml2" if build.with? "xml2"

  def caveats
    <<-EOS.undent
      This is YAMAMOTO Mitsuharu's experimental "Mac port" addition to
      GNU Emacs 24. This provides a native GUI support for Mac OS X
      10.4 - 10.10. After installing, see README-mac and NEWS-mac
      in #{prefix} for the port details.

      Emacs.app was installed to:
        #{prefix}

      To have it accessible from /Applications (using Spotlight 
      and Finder for instance), execute the following commands:

        rm /Applications/Emacs
        osascript -e 'tell application "Finder" to make alias file to POSIX file "#{prefix}/Emacs.app" at POSIX file "/Applications"'

      OLD INSTRUCTIONS BELOW (WHICH WILL NOT WORK WITH SPOTLIGHT):

      To link the application to default Homebrew App location:
        brew linkapps
      or:
        ln -s #{prefix}/Emacs.app /Applications

      For an Emacs.app CLI starter, see:
        https://gist.github.com/4043945
    EOS
  end

  # Follow Homebrew and don't install ctags from Emacs. This allows Vim
  # and Emacs and exuberant ctags to play together without violence.
  def do_not_install_ctags
    if build.without? "ctags"
      (bin/"ctags").unlink
      (share/man/man1/"ctags.1.gz").unlink
    end
  end

  def install
    args = [
      "--prefix=#{prefix}",
      "--enable-locallisppath=#{HOMEBREW_PREFIX}/share/emacs/site-lisp",
      "--infodir=#{info}/emacs",
      "--with-mac",
      "--enable-mac-app=#{prefix}",
    ]

    # icons
    icons_dir = "./mac/Emacs.app/Contents/Resources"
    official_icons = "https://s3.amazonaws.com/emacs-mac-port/Emacs.icns"
    modern_icons = "https://s3.amazonaws.com/emacs-mac-port/Emacs.icns.modern"
    spacemacs_icons = "https://github.com/nashamri/spacemacs-logo/blob/master/spacemacs.icns?raw=true"
    if build.with? "official-icon"
      rm "#{icons_dir}/Emacs.icns"
      curl "#{official_icons}", "-o", "#{icons_dir}/Emacs.icns"
    elsif build.with? "modern-icon"
      rm "#{icons_dir}/Emacs.icns"
      curl "#{modern_icons}", "-o", "#{icons_dir}/Emacs.icns"
    elsif build.with? "spacemacs-icon"
      rm "#{icons_dir}/Emacs.icns"
      curl "-L", "#{spacemacs_icons}", "-o", "#{icons_dir}/Emacs.icns"
    end

    # build
    system "./autogen.sh"
    system "./configure", *args
    system "make"
    system "make", "install"

    # Don't cause ctags clash.
    do_not_install_ctags
  end

  test do
    system "emacs", "--batch"
  end
end
