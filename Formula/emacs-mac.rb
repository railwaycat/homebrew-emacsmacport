class EmacsMac < Formula
  desc "YAMAMOTO Mitsuharu's Mac port of GNU Emacs"
  homepage "https://www.gnu.org/software/emacs/"
  stable do
    url "https://bitbucket.org/mituharu/emacs-mac/get/65c6c96f27afa446df6f9d8eff63f9cc012cc738.tar.gz"
    version "emacs-29.1-mac-10.0"
    sha256 "54d7ba79157c8cb7c3e20be5ce0fbcddd3d5bd0b339b11bc628d7c67a4765b9b"
    patch do
      # patch for multi-tty support, see the following links for details
      # https://bitbucket.org/mituharu/emacs-mac/pull-requests/2/add-multi-tty-support-to-be-on-par-with/diff
      # https://ylluminarious.github.io/2019/05/23/how-to-fix-the-emacs-mac-port-for-multi-tty-access/
      url "https://raw.githubusercontent.com/railwaycat/homebrew-emacsmacport/8b06f75ea28a68f9a490d9001ce33fd1b0d426aa/patches/emacs-mac-29-multi-tty.diff"
      sha256 "4412ce35689e3caf8e8b1d751bf3641b473cd3aef11889d3ecd682474bf204b0"
    end
  end

  head do
    url "https://bitbucket.org/mituharu/emacs-mac.git", branch: "work"
    patch do
      # patch for multi-tty support, see the following links for details
      # https://bitbucket.org/mituharu/emacs-mac/pull-requests/2/add-multi-tty-support-to-be-on-par-with/diff
      # https://ylluminarious.github.io/2019/05/23/how-to-fix-the-emacs-mac-port-for-multi-tty-access/
      url "https://raw.githubusercontent.com/railwaycat/homebrew-emacsmacport/4ff55f8bfc70078c168749a399c87e2d26ee591b/patches/emacs-mac-29.2-rc-1-multi-tty.diff"
      sha256 "4ede698c8f8f5509e3abf4e6a9c73e1dc3909b0f52f52ad4c33068bfaed3d1e4"
    end
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
  option "with-unlimited-select", "Builds with unlimited select, which increases emacs's open file limit to 10000"

  # icons
  ICONS_INFO = {
    "emacs-big-sur-icon"                                  => "e9ec41167c38842a3f6555d3142909211a2aa7e3ff91621b9a576b3847d3b565",
    "emacs-icons-project-EmacsIcon1"                      => "d66373f0498c203aa6f381ebc2fe2307d50cfab45e1d1956df62659ba8357018",
    "emacs-icons-project-EmacsIcon2"                      => "3589e6bff9918c9eba006bf835376f686b6d4fc340ef70550979bcf813c8c447",
    "emacs-icons-project-EmacsIcon3"                      => "0e28424868f51dce1326b9daaf96824606290c2d7fa51bd2340b87420c55a2ca",
    "emacs-icons-project-EmacsIcon4"                      => "8c5af7b604b622acbdb903e0f49b1292f4ac4704961adebe9a395115e1f31f62",
    "emacs-icons-project-EmacsIcon5"                      => "6d5fde04b91a1822772ff2eb8c0a2d115ac8bb81d5fef90e7a62824d0f49c710",
    "emacs-icons-project-EmacsIcon6"                      => "680f4421e62bf212ef43ff0412bb4adbaf4ab3c885a4724cde109bebd772b41a",
    "emacs-icons-project-EmacsIcon7"                      => "e837cec92b98e2fb9635477f3b124d3a07adee14803f336c1c6ec57ce389b4b6",
    "emacs-icons-project-EmacsIcon8"                      => "db5931861e8ce5891bbf894786c261287edfe37059801f76c1509503b00a118f",
    "emacs-icons-project-EmacsIcon9"                      => "1ea513b23e6a36ce2534fe2abe16147c132ddbe78ae54332cc717570c3ecc4bf",
    "emacs-icons-project-emacs-card-blue-deep"            => "7d97d03311b7b1a0ebd0395887fa5f08c6945066bbf8e214cbe9abc621612707",
    "emacs-icons-project-emacs-card-british-racing-green" => "da81c5743aa661828669b2bba75dd4f0f6a8c8603a350cdee02c7de454405224",
    "emacs-icons-project-emacs-card-carmine"              => "535effde04b3f172b5caa810442f6c092aff4a3bf73a65d42e39c0ba68edb41a",
    "emacs-icons-project-emacs-card-green"                => "40598435e5c442d657cba6ae81cda161aba5d579394ae2fad428a1c2f290d8b8",
    "emacs-sexy-icon"                                     => "7ab72feeeff0084e14bcb75a3e1040bdf738e0044361e7af8a67ebbaa58d852a",
    "gnu-head-icon"                                       => "b5899aaa3589b54c6f31aa081daf29d303047aa07b5ca1d0fd7f9333a829b6d3",
    "modern-icon"                                         => "eb819de2380d3e473329a4a5813fa1b4912ec284146c94f28bd24fbb79f8b2c5",
    "sjrmanning-icon"                                     => "fc267d801432da90de5c0d2254f6de16557193b6c062ccaae30d91b3ada01ab9",
    "spacemacs-icon"                                      => "b3db8b7cfa4bc5bce24bc4dc1ede3b752c7186c7b54c09994eab5ec4eaa48900",
    "retro-sink-bw"                                       => "5cd836f86c8f5e1688d6b59bea4b57c8948026a9640257a7d2ec153ea7200571",
  }.freeze
  ICONS_INFO.each do |icon, iconsha|
    option "with-#{icon}", "Using Emacs icon: #{icon}"
    next if build.without? icon

    resource icon do
      url "https://raw.githubusercontent.com/railwaycat/homebrew-emacsmacport/f7490351882f685a50fc6c21024a6af70daa8e0d/icons/#{icon}.icns"
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
  depends_on "tree-sitter" => :recommended
  depends_on "dbus" => :optional
  depends_on "glib" => :optional
  depends_on "imagemagick" => :optional
  depends_on "librsvg" => :optional

  if build.with? "no-title-bars"
    # odie "--with-no-title-bars patch not supported on --HEAD" if build.head?
    patch do
      url "https://raw.githubusercontent.com/railwaycat/homebrew-emacsmacport/667f0efc08506facfc6963ac1fd1d5b9b777e094/patches/emacs-26.2-rc1-mac-7.5-no-title-bar.patch"
      sha256 "8319fd9568037c170f5990f608fb5bd82cd27346d1d605a83ac47d5a82da6066"
    end
  end

  if build.with? "natural-title-bar"
    patch do
      url "https://raw.githubusercontent.com/railwaycat/homebrew-emacsmacport/911412ca8ea2671c1122bc307a1cd0740005a55d/patches/emacs-mac-title-bar-9.1.patch"
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
    args << "--with-tree-sitter" if build.with? "tree-sitter"

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

    if build.with? "unlimited-select"
      ENV.append "CFLAGS", "-DFD_SETSIZE=10000"
      ENV.append "CFLAGS", "-DDARWIN_UNLIMITED_SELECT"
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
    (info/"dir").delete if (info/"dir").exist?
    info.glob("*.info{,.gz}") do |f|
      quiet_system Formula["texinfo"].bin/"install-info", "--quiet", "--info-dir=#{info}", f
    end
  end

  def caveats
    <<~EOS
      This is YAMAMOTO Mitsuharu's "Mac port" addition to
      GNU Emacs 29. This provides a native GUI support for Mac OS X
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
