class EmacsMac < Formula
  desc "YAMAMOTO Mitsuharu's Mac port of GNU Emacs"
  homepage "https://www.gnu.org/software/emacs/"
  url "https://bitbucket.org/mituharu/emacs-mac/get/emacs-27.1-mac-8.0.tar.gz"
  version "emacs-27.1-mac-8.0"
  sha256 "b6a20eafb475a08d25213d475320f85d6acd438319cb7fe2a51e571d651975be"

  head "https://bitbucket.org/mituharu/emacs-mac.git", branch: "work"

  option "with-dbus", "Build with d-bus support"
  option "without-modules", "Build without dynamic modules support"
  option "with-rsvg", "Build with rsvg support"
  option "with-ctags", "Don't remove the ctags executable that emacs provides"
  option "with-no-title-bars",
         "Build with a patch for no title bars on frames (not recommended to use with --HEAD option)"
  option "with-natural-title-bar",
         "Build with a patch for title bar color inferred by theme (not recommended to use with --HEAD option)"
  option "with-modern-icon", "Using a modern style Emacs icon by @tpanum"
  option "with-spacemacs-icon", "Using the spacemacs Emacs icon by Nasser Alshammari"
  option "with-gnu-head-icon", "Using a Bold GNU Head icon by Aurélio A. Heckert"
  option "with-emacs-sexy-icon", "Using the Emacs Sexy icon by @picandocodigo"
  option "with-starter", "Build with a starter script to start emacs GUI from CLI"
  option "with-wordwrap-category", "(experiment!) Build with (backport) patch for wordwrap by category"

  # Update list from
  # https://raw.githubusercontent.com/emacsfodder/emacs-icons-project/master/icons.json
  emacs_icons_project_icons = {
    "EmacsIcon1"                      => "50dbaf2f6d67d7050d63d987fe3743156b44556ab42e6d9eee92248c56011bd0",
    "EmacsIcon2"                      => "8d63589b0302a67f13ab94b91683a8ad7c2b9e880eabe008056a246a22592963",
    "EmacsIcon3"                      => "80dd2a4776739a081e0a42008e8444c729d41ba876b19fa9d33fde98ee3e0ebf",
    "EmacsIcon4"                      => "8ce646ca895abe7f45029f8ff8f5eac7ab76713203e246b70dea1b8a21a6c135",
    "EmacsIcon5"                      => "ca415df7ad60b0dc495626b0593d3e975b5f24397ad0f3d802455c3f8a3bd778",
    "EmacsIcon6"                      => "12a1999eb006abac11535b7fe4299ebb3c8e468360faf074eb8f0e5dec1ac6b0",
    "EmacsIcon7"                      => "f5067132ea12b253fb4a3ea924c75352af28793dcf40b3063bea01af9b2bd78c",
    "EmacsIcon8"                      => "d330b15cec1bcdfb8a1e8f8913d8680f5328d59486596fc0a9439b54eba340a0",
    "EmacsIcon9"                      => "f58f46e5ef109fff8adb963a97aea4d1b99ca09265597f07ee95bf9d1ed4472e",
    "emacs-card-blue-deep"            => "6bdb17418d2c620cf4132835cfa18dcc459a7df6ce51c922cece3c7782b3b0f9",
    "emacs-card-british-racing-green" => "ddf0dff6a958e3b6b74e6371f1a68c2223b21e75200be6b4ac6f0bd94b83e1a5",
    "emacs-card-carmine"              => "4d34f2f1ce397d899c2c302f2ada917badde049c36123579dd6bb99b73ebd7f9",
    "emacs-card-green"                => "f94ade7686418073f04b73937f34a1108786400527ed109af822d61b303048f7",
  }

  emacs_icons_project_icons.each_key do |icon|
    option "with-emacs-icons-project-#{icon}", "Using Emacs icon project #{icon}"
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

  emacs_icons_project_icons.each do |icon, sha|
    resource "emacs-icons-project-#{icon}" do
      url "https://raw.githubusercontent.com/emacsfodder/emacs-icons-project/master/#{icon}.icns"
      sha256 sha
    end
  end

  resource "modern-icon" do
    url "https://s3.amazonaws.com/emacs-mac-port/Emacs.icns.modern"
    sha256 "eb819de2380d3e473329a4a5813fa1b4912ec284146c94f28bd24fbb79f8b2c5"
  end

  resource "spacemacs-icon" do
    url "https://github.com/nashamri/spacemacs-logo/blob/master/spacemacs.icns?raw=true"
    sha256 "b3db8b7cfa4bc5bce24bc4dc1ede3b752c7186c7b54c09994eab5ec4eaa48900"
  end

  resource "gnu-head-icon" do
    url "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/icons/gnu-head.icns"
    sha256 "b5899aaa3589b54c6f31aa081daf29d303047aa07b5ca1d0fd7f9333a829b6d3"
  end

  resource "emacs-sexy-icon" do
    url "https://emacs.sexy/img/Emacs.icns"
    sha256 "7ab72feeeff0084e14bcb75a3e1040bdf738e0044361e7af8a67ebbaa58d852a"
  end

  # declare all patches as resource, workaround issue #214
  resource "natural-title-bar-patch" do
    url "https://raw.githubusercontent.com/railwaycat/homebrew-emacsmacport/master/build-scripts/emacs-mac-title-bar-7.4.patch"
    sha256 "5512577b3495ed10442883e79b2ec1c8a1325495698eee8c1f0a0d90574de897"
  end

  resource "no-title-bars-patch" do
    url "https://raw.githubusercontent.com/railwaycat/homebrew-emacsmacport/master/build-scripts/emacs-26.2-rc1-mac-7.5-no-title-bar.patch"
    sha256 "8319fd9568037c170f5990f608fb5bd82cd27346d1d605a83ac47d5a82da6066"
  end

  resource "multi-tty-patch" do
    url "https://raw.githubusercontent.com/railwaycat/homebrew-emacsmacport/master/build-scripts/multi-tty-27.diff"
    sha256 "5a13e83e79ce9c4a970ff0273e9a3a07403cc07f7333a0022b91c191200155a1"
  end

  if build.with? "no-title-bars"
    # odie "--with-no-title-bars patch not supported on --HEAD" if build.head?
    patch do
      url "https://raw.githubusercontent.com/railwaycat/homebrew-emacsmacport/master/build-scripts/emacs-26.2-rc1-mac-7.5-no-title-bar.patch"
      sha256 "8319fd9568037c170f5990f608fb5bd82cd27346d1d605a83ac47d5a82da6066"
    end
  end

  if build.with? "natural-title-bar"
    patch do
      url "https://raw.githubusercontent.com/railwaycat/homebrew-emacsmacport/master/build-scripts/emacs-mac-title-bar-7.4.patch"
      sha256 "5512577b3495ed10442883e79b2ec1c8a1325495698eee8c1f0a0d90574de897"
    end
  end

  if build.with? "wordwrap-category"
    patch do
      url "https://raw.githubusercontent.com/railwaycat/homebrew-emacsmacport/master/build-scripts/word-wrap.diff"
      sha256 "bb576007e2d1d52313ab355e17f8e96aa522492102b070ec999ee17ae8cd22dd"
    end
  end

  # patch for multi-tty support, see the following links for details
  # https://bitbucket.org/mituharu/emacs-mac/pull-requests/2/add-multi-tty-support-to-be-on-par-with/diff
  # https://ylluminarious.github.io/2019/05/23/how-to-fix-the-emacs-mac-port-for-multi-tty-access/
  patch do
    url "https://raw.githubusercontent.com/railwaycat/homebrew-emacsmacport/master/build-scripts/multi-tty-27.diff"
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

    icons_dir = buildpath/"mac/Emacs.app/Contents/Resources"

    (%w[EmacsIcon1 EmacsIcon2 EmacsIcon3 EmacsIcon4
        EmacsIcon5 EmacsIcon6 EmacsIcon7 EmacsIcon8
        EmacsIcon9 emacs-card-blue-deep emacs-card-british-racing-green
        emacs-card-carmine emacs-card-green].map { |i| "emacs-icons-project-#{i}" } +
     %w[modern-icon spacemacs-icon gnu-head-icon emacs-sexy-icon]).each do |icon|
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

  def caveats
    <<~EOS
      This is YAMAMOTO Mitsuharu's "Mac port" addition to
      GNU Emacs 26. This provides a native GUI support for Mac OS X
      10.6 - 10.15. After installing, see README-mac and NEWS-mac
      in #{prefix} for the port details.

      Emacs.app was installed to:
        #{prefix}

      To link the application to default Homebrew App location:
        ln -s #{prefix}/Emacs.app /Applications
      Other ways please refer:
        https://github.com/railwaycat/homebrew-emacsmacport/wiki/Alternative-way-of-place-Emacs.app-to-Applications-directory

      For an Emacs.app CLI starter, see:
        https://gist.github.com/4043945
    EOS
  end

  test do
    assert_equal "4", shell_output("#{bin}/emacs --batch --eval=\"(print (+ 2 2))\"").strip
  end
end
