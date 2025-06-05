# Library

This directory for the shared code between formula versions.

## UrlResolver.rb

This file include two classes `UrlResolver` and
`CopyDownloadStrategy`.

`UrlResolver` a modification based on UrlResolver class from
d12frosted's
[emacs-plus](https://github.com/d12frosted/homebrew-emacs-plus):
https://github.com/d12frosted/homebrew-emacs-plus/blob/3e95d573d5f13aba7808193b66312b38a7c66851/Library/UrlResolver.rb

This class be used to support both brew installation and formula local
building(outside of brew tap).

`CopyDownloadStrategy` is the same as the one from emacs-plus:
https://github.com/d12frosted/homebrew-emacs-plus/blob/c8bb5ccf04f0360c668ade0d71b7a07becd1ddae/Library/EmacsBase.rb#L4

## Icons.rb

This file include the name and hash of all supported icons.
