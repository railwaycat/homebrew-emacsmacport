#!/usr/bin/env ruby
# coding: utf-8
#  Copyright © 2016 David Caldwell
#  Copyright © 2019 Xin Xu
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'pathname'
require File.join File.expand_path(File.dirname(__FILE__)),'verbose-shell.rb'
Vsh = VerboseShell
Vsh.verbose = true

def copy_lib(exe, brew_dir, dest, options={})
  options[:rel_path_to_dest] ||= "@executable_path/" + Pathname.new(dest).relative_path_from(Pathname.new(exe).dirname).to_s
  `otool -L #{exe}`.split("\n").each do |line| # ex:   /Volumes/sensitive/src/build-emacs/brew/opt/gnutls/lib/libgnutls.30.dylib (compatibility version 37.0.0, current version 37.6.0)
    (m,orig,brew_path,lib)=line.match(%r,^\s+(#{brew_dir}(/[^ ]+)/(lib[^/ ]+))\s,).to_a
    if m
      with_writable_mode(exe) {
        if lib == File.basename(exe)
          Vsh.system(*%W"install_name_tool -id #{dest}/#{lib} #{exe}") # remove our local build path from the id to leak as little as possible (not that it really matters)
        else
          Vsh.system(*%W"install_name_tool -change #{orig} #{options[:rel_path_to_dest]}/#{lib} #{exe}") # Point the libs to the newly embedded lib directory
        end
      }
      unless lib == File.basename(exe) || File.exist?(File.join(dest, lib))
        Vsh.mkdir_p(dest)
        Vsh.cp(File.join(brew_dir, brew_path, lib), dest)
        copy_lib(File.join(dest, lib), brew_dir, dest, options) # Copy lib's deps, too
      end
    end
  end
end

def with_writable_mode(file)
  old = File.stat(file).mode
  File.chmod(0775, file)
  yield
  File.chmod(old, file)
end

brew_dir = ARGV[0]
copy_lib("#{Dir.pwd}/tmproot/Emacs.app/Contents/MacOS/Emacs", brew_dir, "#{Dir.pwd}/tmproot/Emacs.app/Contents/MacOS/lib") # Install and adjust libs into the App.
