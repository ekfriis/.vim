set nocompatible
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Don't mess up local directories
set dir=~/Code/.vimCrap
set backupdir=~/Code/.vimCrap

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"" Reduce autocomplete
set complete=.,w,b

" Enable syntax highlighting
syntax on

" Highlight last searched term
set cursorline
set cursorcolumn
set hlsearch
set hidden
set autowrite
set expandtab
set nowrap
set number
set visualbell
set noerrorbells
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.root,*.pyc,*.png,*.pdf,*.ps,*CVS/*,*/lxbatch/*,*/crab/*,*/lxbatch_log/*
set ignorecase
set smartcase
set scrolloff=3
set novisualbell

" Enable filetype detection
filetype plugin indent on

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set autoindent		" always set autoindenting on

set shiftwidth=2

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" Delete trailing whitespace before saving in cpp and python
autocmd BufWritePre *.cc,*.h,*py :%s/\s\+$//e

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif
augroup END

" NERD Tree settings
map <silent> <C-P> <ESC>:NERDTreeToggle<CR>
let NERDTreeIgnore=['CVS', 'pyc$', '\.root$', 'pdf$', 'png$', '@Batch', 'xml.bak$', 'xml.fragment$']
let NERDTreeWinSize=61
let NERDTreeWinPos=0
let NERDTreeChDirMode=2 "always set root as cwd
let NERDTreeChristmasTree = 1
