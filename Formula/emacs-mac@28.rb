require_relative "../Library/UrlResolver.rb"
require_relative "../Library/Icons.rb"

class EmacsMacAT28 < Formula
  desc "YAMAMOTO Mitsuharu's Mac port of GNU Emacs"
  homepage "https://www.gnu.org/software/emacs/"

  @@urlResolver = UrlResolver.new(ENV["HOMEBREW_EMACS_MAC_MODE"] || "remote")

  stable do
    url "https://bitbucket.org/mituharu/emacs-mac/get/25008e087de5e784605a7fe0b445af0cbfa6bfc4.tar.gz"
    version "emacs-28.3-rc1-mac-9.2"
    sha256 "0442b892974771bb38ea6db17c1d933265851c520ce37c30716728313448d04f"
  end

  head do
    url "https://bitbucket.org/mituharu/emacs-mac.git", branch: "mac-28"
  end

  option "without-modules", "Build without dynamic modules support"
  option "with-ctags", "Don't remove the ctags executable that emacs provides"
  option "with-no-title-bars",
         "Build with a patch for no title bars on frames (not recommended to use with --HEAD option)"
  option "with-natural-title-bar",
         "Build with a patch for title bar color inferred by theme (not recommended to use with --HEAD option)"
  option "with-starter", "Build with a starter script to start emacs GUI from CLI"
  option "with-mac-metal", "use Metal framework in application-side double buffering (experimental)"
  option "with-native-comp", "Build with native compilation (same as \"--with-native-compilation\", for compatibility only)"
  option "with-native-compilation", "Build with native compilation"
  option "with-xwidgets", "Build with xwidgets"

  # icons
  ICONS_INFO.each do |icon, iconsha|
    option "with-#{icon}", "Using Emacs icon: #{icon}"
    next if build.without? icon

    resource icon do
      url (@@urlResolver.icon_url icon), using: CopyDownloadStrategy
      sha256 iconsha
    end
  end

  deprecated_option "keep-ctags" => "with-ctags"
  deprecated_option "icon-official" => "with-official-icon"
  deprecated_option "icon-modern" => "with-modern-icon"

  depends_on "autoconf"
  depends_on "automake"
  depends_on "gnutls"
  depends_on "pkg-config"
  depends_on "texinfo"
  depends_on "jansson" => :recommended
  depends_on "libxml2" => :recommended
  depends_on "dbus" => :optional
  depends_on "glib" => :optional
  depends_on "imagemagick" => :optional
  depends_on "librsvg" => :optional

  patch do
    # patch for multi-tty support, see the following links for details
    # https://bitbucket.org/mituharu/emacs-mac/pull-requests/2/add-multi-tty-support-to-be-on-par-with/diff
    # https://ylluminarious.github.io/2019/05/23/how-to-fix-the-emacs-mac-port-for-multi-tty-access/
    url (@@urlResolver.patch_url "emacs-mac-28.3-rc-1-multi-tty-27"), using: CopyDownloadStrategy
    sha256 "b0e26dd07d089786a59faebe138820f01ff0365fb9c9597b47c7b07c451fea56"
  end

  if build.with? "no-title-bars"
    # odie "--with-no-title-bars patch not supported on --HEAD" if build.head?
    patch do
      url (@@urlResolver.patch_url "emacs-26.2-rc1-mac-7.5-no-title-bar"), using: CopyDownloadStrategy
      sha256 "8319fd9568037c170f5990f608fb5bd82cd27346d1d605a83ac47d5a82da6066"
    end
  end

  if build.with? "natural-title-bar"
    patch do
      url (@@urlResolver.patch_url "emacs-mac-title-bar-9.1"), using: CopyDownloadStrategy
      sha256 "297203d750c5c2d9f05aa68f1f47f1bda43419bf1b9ba63f8167625816c3a88d"
    end
  end

  if (build.with? "native-comp") || (build.with? "native-compilation")
    depends_on "libgccjit" => :recommended
    depends_on "gcc" => :build
  end

  def install
    args = [
      "--enable-locallisppath=#{HOMEBREW_PREFIX}/share/emacs/site-lisp",
      "--infodir=#{info}",
      "--mandir=#{man}",
      "--prefix=#{prefix}",
      "--with-mac",
      "--enable-mac-app=#{prefix}",
      "--with-gnutls",
    ]
    args << "--with-modules" if build.with? "modules"
    args << "--with-rsvg" if build.with? "rsvg"
    args << "--with-mac-metal" if build.with? "mac-metal"
    args << "--with-native-compilation" if (build.with? "native-comp") || (build.with? "native-compilation")
    args << "--with-xwidgets" if build.with? "xwidgets"

    if (build.with? "native-comp") || (build.with? "native-compilation")
      gcc_ver = Formula["gcc"].any_installed_version
      gcc_ver_major = gcc_ver.major
      gcc_lib="#{HOMEBREW_PREFIX}/lib/gcc/#{gcc_ver_major}"

      ENV.append "CFLAGS", "-I#{Formula["gcc"].include}"
      ENV.append "CFLAGS", "-I#{Formula["libgccjit"].include}"

      ENV.append "LDFLAGS", "-L#{gcc_lib}"
      ENV.append "LDFLAGS", "-I#{Formula["gcc"].include}"
      ENV.append "LDFLAGS", "-I#{Formula["libgccjit"].include}"
    end

    icons_dir = buildpath/"mac/Emacs.app/Contents/Resources"
    ICONS_INFO.each do |icon,|
      next if build.without? icon

      rm "#{icons_dir}/Emacs.icns"
      resource(icon).stage do
        icons_dir.install Dir["*.icns*"].first => "Emacs.icns"
      end
    end

    system "./autogen.sh"
    system "./configure", *args
    system "make"
    system "make", "install"
    prefix.install "NEWS-mac"

    # Follow Homebrew and don't install ctags from Emacs. This allows Vim
    # and Emacs and exuberant ctags to play together without violence.
    if build.without? "ctags"
      (bin/"ctags").unlink
      (share/man/man1/"ctags.1.gz").unlink
    end

    if build.with? "starter"
      # Replace the symlink with one that starts GUI
      # alignment the behavior with cask
      # borrow the idea from emacs-plus
      (bin/"emacs").unlink
      (bin/"emacs").write <<~EOS
        #!/bin/bash
        exec #{prefix}/Emacs.app/Contents/MacOS/Emacs.sh "$@"
      EOS
    end
  end

  def post_install
    if (build.with? "native-comp") || (build.with? "native-compilation")
      ln_sf "#{Dir[opt_prefix/"lib/emacs/*"].first}/native-lisp", "#{opt_prefix}/Emacs.app/Contents/native-lisp"
    end
  end

  def caveats
    <<~EOS
      This is YAMAMOTO Mitsuharu's "Mac port" addition to
      GNU Emacs 28. This provides a native GUI support for Mac OS X
      10.10 - 13. After installing, see README-mac and NEWS-mac
      in #{prefix} for the port details.

      Emacs.app was installed to:
        #{prefix}

      To link the application to default App location and CLI scripts, please checkout:
        https://github.com/railwaycat/homebrew-emacsmacport/blob/master/docs/emacs-start-helpers.md

      If you are using Doom Emacs, be sure to run doom sync:
        ~/.emacs.d/bin/doom sync

      For an Emacs.app CLI starter, see:
        https://gist.github.com/4043945

      Emacs mac port also available on MacPorts with name "emacs-mac-app" and "emacs-mac-app-devel", but they are not maintained by the maintainer of this formula.
    EOS
  end

  test do
    assert_equal "4", shell_output("#{bin}/emacs --batch --eval=\"(print (+ 2 2))\"").strip
  end
end
