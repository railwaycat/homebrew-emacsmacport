class CopyDownloadStrategy < AbstractFileDownloadStrategy
  # Function from
  # https://github.com/d12frosted/homebrew-emacs-plus/blob/c8bb5ccf04f0360c668ade0d71b7a07becd1ddae/Library/EmacsBase.rb#L4
  def initialize(url, name, version, **meta)
    super(url, name, version, **meta)
    @cached_location = Pathname.new url
  end
end

# This is a modification based on UrlResolver class from d12frosted's
# emacs-plus

class UrlResolver
  HOMEBREW_EMACS_MAC_TAP_OWNER = "railwaycat"
  HOMEBREW_EMACS_MAC_TAP_REPO = "emacsmacport"
  def initialize(mode)
    tap = Tap.fetch(HOMEBREW_EMACS_MAC_TAP_OWNER, HOMEBREW_EMACS_MAC_TAP_REPO)
    @formula_root =
      mode == "local" || !tap.installed? ?
        Dir.pwd : tap.path.to_s
  end

  def patch_url name
    "#{@formula_root}/patches/#{name}.diff"
  end

  def icon_url name
    "#{@formula_root}/icons/#{name}.icns"
  end
end
