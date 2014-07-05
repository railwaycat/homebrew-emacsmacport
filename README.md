# Homebrew-emacsmacport
### Usage
- Enable:
```
    brew tap railwaycat/emacsmacport
```

- Install:
```
    brew install emacs-mac
```

Note: If you want info files from emacs been installed under `{brew --prefix}/share/info`, an enviroment variable `HOMEBREW_KEEP_INFO` set to `1` is needed before install. Prepend `{brew --prefix}/share/info` to your `INFOPATH` is also suggested to access these info files. Read more: `man brew`. For example:


```
    export HOMEBREW_KEEP_INFO=1
    export INFOPATH='/usr/local/share/info:/usr/share/info'
```

If you use [cask](http://caskroom.io/), run `brew cask install emacs-mac`.

- Disable:
```
    brew untap railwaycat/emacsmacport
```
