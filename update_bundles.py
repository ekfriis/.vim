#!/usr/bin/env python

import os
import sys
import subprocess

git_bundles = [ 
  "git://github.com/scrooloose/nerdtree.git",
  "git://github.com/scrooloose/nerdcommenter.git",
  "git://github.com/wincent/Command-T",
  "git://github.com/timcharper/textile.vim.git",
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-git.git",
  "git://github.com/tpope/vim-markdown.git",
  "git://github.com/tpope/vim-repeat.git",
  "git://github.com/tpope/vim-surround.git",
  "git://github.com/tpope/vim-vividchalk.git",
  "git://github.com/tsaleh/vim-align.git",
  "git://github.com/tsaleh/vim-supertab.git",
  "git://github.com/tsaleh/vim-tcomment.git",
  "git://repo.or.cz/vcscommand",
  "git://github.com/tpope/vim-unimpaired.git",
  "git://github.com/vim-bundles/fuzzyfinder.git",
  "git://github.com/vim-scripts/SearchComplete.git",
  "git://github.com/vim-scripts/c.vim.git",
  "git://github.com/vim-scripts/taglist.vim.git",
  "git://github.com/vim-scripts/wombat256.vim.git",
  "git://github.com/vim-scripts/camelcasemotion.git",
  "git://github.com/vim-scripts/Pydiction.git",
  "git://github.com/vim-scripts/pyflakes.vim.git",
  "git://github.com/vim-scripts/python.vim--Vasiliev.git",
]

def map_name(name):
  return os.path.join('bundle', os.path.splitext(os.path.basename(name))[0])

if __name__ == "__main__":
  if sys.argv[1] == "update":
    for bundle in git_bundles:
      path = map_name(bundle)
      print "Adding", bundle
      subprocess.call(['git', 'submodule', 'add', bundle, path])
      
