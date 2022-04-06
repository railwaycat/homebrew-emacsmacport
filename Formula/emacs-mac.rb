# coding: utf-8
class EmacsMac < Formula
  desc "YAMAMOTO Mitsuharu's Mac port of GNU Emacs"
  homepage "https://www.gnu.org/software/emacs/"
  url "https://bitbucket.org/mituharu/emacs-mac/get/emacs-28.1-mac-9.0.tar.gz"
  version "emacs-28.1-mac-9.0"
  sha256 "967d5642ca47ae3de2626f0fc7163424e36925642827e151c3906179020dd90e"

  head "https://bitbucket.org/mituharu/emacs-mac.git", branch: "work"

  option "with-dbus", "Build with d-bus support"
  option "without-modules", "Build without dynamic modules support"
  option "with-rsvg", "Build with rsvg support"
  option "with-ctags", "Don't remove the ctags executable that emacs provides"
  option "with-no-title-bars",
         "Build with a patch for no title bars on frames (not recommended to use with --HEAD option)"
  option "with-natural-title-bar",
         "Build with a patch for title bar color inferred by theme (not recommended to use with --HEAD option)"
  option "with-starter", "Build with a starter script to start emacs GUI from CLI"
  option "with-mac-metal", "use Metal framework in application-side double buffering (experimental)"
  option "with-native-comp", "Build with native compilation"

  # icons
  ICONS_INFO = {
    "emacs-big-sur-icon" => "e9ec41167c38842a3f6555d3142909211a2aa7e3ff91621b9a576b3847d3b565",
    "emacs-icons-project-EmacsIcon1" => "50dbaf2f6d67d7050d63d987fe3743156b44556ab42e6d9eee92248c56011bd0",
    "emacs-icons-project-EmacsIcon2" => "8d63589b0302a67f13ab94b91683a8ad7c2b9e880eabe008056a246a22592963",
    "emacs-icons-project-EmacsIcon3" => "80dd2a4776739a081e0a42008e8444c729d41ba876b19fa9d33fde98ee3e0ebf",
    "emacs-icons-project-EmacsIcon4" => "8ce646ca895abe7f45029f8ff8f5eac7ab76713203e246b70dea1b8a21a6c135",
    "emacs-icons-project-EmacsIcon5" => "ca415df7ad60b0dc495626b0593d3e975b5f24397ad0f3d802455c3f8a3bd778",
    "emacs-icons-project-EmacsIcon6" => "12a1999eb006abac11535b7fe4299ebb3c8e468360faf074eb8f0e5dec1ac6b0",
    "emacs-icons-project-EmacsIcon7" => "f5067132ea12b253fb4a3ea924c75352af28793dcf40b3063bea01af9b2bd78c",
    "emacs-icons-project-EmacsIcon8" => "d330b15cec1bcdfb8a1e8f8913d8680f5328d59486596fc0a9439b54eba340a0",
    "emacs-icons-project-EmacsIcon9" => "f58f46e5ef109fff8adb963a97aea4d1b99ca09265597f07ee95bf9d1ed4472e",
    "emacs-icons-project-emacs-card-blue-deep" => "6bdb17418d2c620cf4132835cfa18dcc459a7df6ce51c922cece3c7782b3b0f9",
    "emacs-icons-project-emacs-card-british-racing-green" => "ddf0dff6a958e3b6b74e6371f1a68c2223b21e75200be6b4ac6f0bd94b83e1a5",
    "emacs-icons-project-emacs-card-carmine" => "4d34f2f1ce397d899c2c302f2ada917badde049c36123579dd6bb99b73ebd7f9",
    "emacs-icons-project-emacs-card-green" => "f94ade7686418073f04b73937f34a1108786400527ed109af822d61b303048f7",
    "emacs-sexy-icon" => "7ab72feeeff0084e14bcb75a3e1040bdf738e0044361e7af8a67ebbaa58d852a",
    "gnu-head-icon" => "b5899aaa3589b54c6f31aa081daf29d303047aa07b5ca1d0fd7f9333a829b6d3",
    "modern-icon" => "eb819de2380d3e473329a4a5813fa1b4912ec284146c94f28bd24fbb79f8b2c5",
    "sjrmanning-icon" => "fc267d801432da90de5c0d2254f6de16557193b6c062ccaae30d91b3ada01ab9",
    "spacemacs-icon" => "b3db8b7cfa4bc5bce24bc4dc1ede3b752c7186c7b54c09994eab5ec4eaa48900",
    "retro-sink-bw" => "5cd836f86c8f5e1688d6b59bea4b57c8948026a9640257a7d2ec153ea7200571"
  }.freeze
  ICONS_INFO.each do |icon, iconsha|
    option "with-#{icon}", "Using Emacs icon: #{icon}"
    next if build.without? "#{icon}"
    resource "#{icon}" do
      url "https://raw.githubusercontent.com/railwaycat/homebrew-emacsmacport/f27bd8d442fa40d4d96926a6bd94f0889184d966/icons/#{icon}.icns"
      sha256 iconsha
    end
  end

  deprecated_option "keep-ctags" => "with-ctags"
  deprecated_option "icon-official" => "with-official-icon"
  deprecated_option "icon-modern" => "with-modern-icon"

  depends_on "autoconf"
  depends_on "automake"
  depends_on "d-bus" if build.with? "dbus"
  depends_on "gnutls"
  depends_on "librsvg" if build.with? "rsvg"
  depends_on "pkg-config"
  depends_on "texinfo"
  depends_on "jansson" => :recommended
  depends_on "libxml2" => :recommended
  depends_on "glib" => :optional
  depends_on "imagemagick" => :optional

  if build.with? "no-title-bars"
    # odie "--with-no-title-bars patch not supported on --HEAD" if build.head?
    patch do
      url "https://raw.githubusercontent.com/railwaycat/homebrew-emacsmacport/667f0efc08506facfc6963ac1fd1d5b9b777e094/patches/emacs-26.2-rc1-mac-7.5-no-title-bar.patch"
      sha256 "8319fd9568037c170f5990f608fb5bd82cd27346d1d605a83ac47d5a82da6066"
    end
  end

  if build.with? "natural-title-bar"
    patch do
      url "https://raw.githubusercontent.com/railwaycat/homebrew-emacsmacport/7b3efcb066625f7a3423a229ff1a8d8a53fa6175/patches/emacs-mac-title-bar-8.3.patch"
      sha256 "21f7fca8d91650bd705c218995084eaa6a8eed9a0c46516299feabee5ecafb63"
    end
  end

  if build.with? "native-comp"
    depends_on "libgccjit" => :recommended
    depends_on "gcc" => :build
  end

  # patch for multi-tty support, see the following links for details
  # https://bitbucket.org/mituharu/emacs-mac/pull-requests/2/add-multi-tty-support-to-be-on-par-with/diff
  # https://ylluminarious.github.io/2019/05/23/how-to-fix-the-emacs-mac-port-for-multi-tty-access/
  patch do
    url "https://raw.githubusercontent.com/railwaycat/homebrew-emacsmacport/667f0efc08506facfc6963ac1fd1d5b9b777e094/patches/multi-tty-27.diff"
    sha256 "5a13e83e79ce9c4a970ff0273e9a3a07403cc07f7333a0022b91c191200155a1"
  end

  def install
    args = [
      "--enable-locallisppath=#{HOMEBREW_PREFIX}/share/emacs/site-lisp",
      "--infodir=#{info}/emacs",
      "--prefix=#{prefix}",
      "--with-mac",
      "--enable-mac-app=#{prefix}",
      "--with-gnutls",
    ]
    args << "--with-modules" unless build.without? "modules"
    args << "--with-rsvg" if build.with? "rsvg"
    args << "--with-mac-metal" if build.with? "mac-metal"
    args << "--with-native-compilation" if build.with? "native-comp"

    if build.with? "native-comp"
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
      next unless build.with? icon

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
    if build.with? "native-comp"
      ln_sf "#{Dir[opt_prefix/"lib/emacs/*"].first}/native-lisp", "#{opt_prefix}/Emacs.app/Contents/native-lisp"
    end
  end

  def caveats
    <<~EOS
      This is YAMAMOTO Mitsuharu's "Mac port" addition to
      GNU Emacs 28. This provides a native GUI support for Mac OS X
      10.10 - 12. After installing, see README-mac and NEWS-mac
      in #{prefix} for the port details.

      Emacs.app was installed to:
        #{prefix}

      To link the application to default Homebrew App location:
        osascript -e 'tell application "Finder" to make alias file to POSIX file "#{prefix}/Emacs.app" at POSIX file "/Applications"'
      You can use ln -s, but symlinks created this way don't show up in Spotlight:
        ln -s #{prefix}/Emacs.app /Applications

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
