set nocompatible
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Don't mess up local directories
set dir=~/.vim_crud
set backupdir=~/.vim_crud

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"" Reduce autocomplete
set complete=.,w,b

" Enable syntax highlighting
syntax on

" Highlight last searched term
"set cursorline
"set cursorcolumn
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

let g:syntastic_auto_loc_list=1
set statusline=%t\ %m%r[%04l,%02c]
set statusline+=\ \ %#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2
set noerrorbells
set vb t_vb=
set spell
set tw=80

" Don't use plaintex, but tex
let g:tex_flavor='latex'

hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black

function! MyStatusLine(mode)
    let statusline=""
    if a:mode == 'Enter'
        let statusline.="%#StatColor#"
    endif
    let statusline.="\(%n\)\ %f\ "
    if a:mode == 'Enter'
        let statusline.="%*"
    endif
    let statusline.="%#Modified#%m"
    if a:mode == 'Leave'
        let statusline.="%*%r"
    elseif a:mode == 'Enter'
        let statusline.="%r%*"
    endif
    let statusline .= "\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ "
    return statusline
endfunction

au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
set statusline=%!MyStatusLine('Enter')

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi StatColor guibg=orange ctermbg=lightred
  elseif a:mode == 'r'
    hi StatColor guibg=#e454ba ctermbg=magenta
  elseif a:mode == 'v'
    hi StatColor guibg=#e454ba ctermbg=magenta
  else
    hi StatColor guibg=red ctermbg=red
  endif
endfunction 

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black

map \c" "+yi"
map \c' "+yi'
map \cW "+yiW
map \cw "+yiw

command! CondenseBlanks :%s/\n\{3,}/\r\r/e
let $uw='/afs/hep.wisc.edu/home/efriis'

func! WordProcessorMode() 
  setlocal formatoptions=1 
  setlocal noexpandtab 
  map j gj 
  map k gk 
  setlocal smartindent 
  setlocal spell spelllang=en_us 
  setlocal wrap 
  setlocal linebreak 
  setlocal syntax=none 
endfu 
com! WP call WordProcessorMode() 
