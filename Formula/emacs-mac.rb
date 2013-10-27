require 'formula'

class EmacsMac < Formula
  homepage 'http://www.gnu.org/software/emacs/'

  head 'https://github.com/railwaycat/emacs-mac-port.git'
  url 'https://github.com/railwaycat/emacs-mac-port.git', :using => :git, :tag => 'v4.4.1'
  version 'emacs-24.3-mac-4.4.1'

  depends_on 'automake' => :build
  depends_on 'pkg-config' => :build

  option 'with-dbus', 'Build with d-bus support'
  option 'with-xml2', 'Build with libxml2 support'

  depends_on 'd-bus' if build.include? 'with-dbus'
  depends_on 'gnutls' => :optional
  depends_on 'imagemagick' => :optional
  depends_on 'libxml2' if build.include? 'with-xml2'

  def caveats
    s = ""
    s += <<-EOS.undent

      This is YAMAMOTO Mitsuharu's experimental "Mac port" addition to
      GNU Emacs 24. This provides a native GUI support for Mac OS X
      10.4 - 10.8. After installing, see README-mac and NEWS-mac
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

    EOS

    return s
  end

  def install
    args = ["--prefix=#{prefix}",
            "--enable-locallisppath=#{HOMEBREW_PREFIX}/share/emacs/site-lisp",
            "--infodir=#{info}/emacs",
            "--with-mac",
            "--enable-mac-app=#{prefix}"]

    # build
    system "./configure", *args
    system "make"
    system "make install"

  end
end
