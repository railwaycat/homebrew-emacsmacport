# Emacs Start Helpers

By default, both Homebrew formula and cask will install `emacs` with `emacsclient`, `ebrowse`, and `etags` commands to your `$(brew --prefix)/bin`. Run `emacs` from a terminal emulator, a GUI Emacs window will be spawned from that terminal session, and stay in the foreground.

The behavior of installing `Emacs.app` bundle is different from Homebrew formula and cask. For Homebrew formula, an `Emacs.app` will be placed under `$(brew --prefix)/opt/emacs-mac/`, but **not** under `/Applications`; for Homebrew cask, an `Emacs.app` will be placed under `/Applications`.

To make the behavior of starting consistent and handy, people made helper scripts and apps. This page collects them below.

## CLI scripts
These scripts usually replace or along with the existing `emacs` command and usually be called from CLI. All CLI start scripts should be able to accept an argument for a file or directory.

### Starter script 1
This is a very simple starter script.

When emacs-mac is installed with `--with-starter` option, it will replace the symbolic link `emacs` command with this script. This starter script intent to provide the same behavior as [Emacs-plus](https://github.com/d12frosted/homebrew-emacs-plus).

#### Installation
This script can be installed by option `--with-starter`. This option **only available** when install by formula.

For an already-installed Emacs-mac, place the following code in a script file, rename and place it in a good place.

```
#!/bin/bash
exec $(brew --prefix)/opt/emacs-mac/Emacs.app/Contents/MacOS/Emacs.sh "$@"
```

### Starter script 2
This is the script originally from [Aquamacs](https://aquamacs.org/) and is modified.

This script starts an Emacs GUI window if Emacs is not started; it will bring the Emacs window to the front if Emacs is already running.

#### Installation
Get the script from https://gist.github.com/railwaycat/4043945 . There are also useful updates and rewrites in the comment of this gist.

## GUI helpers
GUI helpers are usually for the Emacs-mac installed by formula, since formula installation is not able to put an App bundle `Emacs.app` to `/Applications` by the restriction of Homebrew.  You can avoid the need for a GUI helper by installing from cask.

### helper 1
Make a copy of `Emacs.app` to `/Applications`. This solution is hard to be classified as a helper script/app, but it might be the solution most close to a native app.

Pros: Most likely close to a native `Emacs.app`.

Cons: Need to repeat the install step for every upgrade and build option change.

#### Installation
Copy the `Emacs.app` from `$(brew --prefix)/opt/emacs-mac/` to `/Applications` manually or by a shell script.
```bash
cp -a $(brew --prefix)/opt/emacs-mac/Emacs.app /Applications
```

### Helper 2
Create a simple app bundle that opens `Emacs.app` under Homebrew directory.

Pros: No need to be updated for every upgrade or build option change. No Spotlight priority issue.
Cons: Hard to be pinned on Dock.

#### Installation
Run the command below to create a starter app bundle. Rename it if possible and place it under `/Applications` or other preferred places.
```
osacompile -o Emacs.app -e 'tell application "Finder" to open POSIX file "'"$(brew --prefix)"'/opt/emacs-mac/Emacs.app"'
```

### Helper 3
An alias of `Emacs.app` under `/Applications`.

Pros: No need to be updated for every upgrade or build option change

Cons: When using Spotlight, the alias `Emacs.app` may not be listed on the top of candidates. May cause issues for native compilation, see #317.

#### Installation
Create an alias to `$(brew --prefix)/opt/emacs-mac/Emacs.app`. This step can be done manually by right click the app and selecting "Make Alias" from the context menu, or by the command below:

```
# Apple Silicon Macs
osascript -e 'tell application "Finder" to make alias file to POSIX file "/opt/homebrew/opt/emacs-mac/Emacs.app" at POSIX file "/Applications"'

# Intel Macs
osascript -e 'tell application "Finder" to make alias file to POSIX file "/usr/local/opt/emacs-mac/Emacs.app" at POSIX file "/Applications"'
```
