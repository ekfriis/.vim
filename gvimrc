"colorscheme wombat256mod
colorscheme molokai
set makeprg=~/scripts/make_at_ucd.py\ %:p:h

set guioptions-=T " no toolbar
set guioptions-=l " no scrollbars
set guioptions-=r
set guioptions-=L
set guioptions-=R

"set tags=tags;/,~/Code/root_tags
set tags=~/Code/root_tags
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++'

set lines=62
set columns=230
set cursorline
set cursorcolumn
set colorcolumn=80
set visualbell
set noerrorbells
