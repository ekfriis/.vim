set nocompatible               " Be iMproved

if has('vim_starting')
 set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Vimproc to asynchronously run commands (NeoBundle, Unite)
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Sensible defaults
NeoBundle 'tpope/vim-sensible'

" Unite. The interface to rule almost everything
NeoBundle 'Shougo/unite.vim'

" Unite sources {{{
NeoBundleLazy 'Shougo/unite-outline', {'autoload':{'unite_sources':'outline'}}
NeoBundleLazy 'Shougo/unite-session', {'autoload':{'unite_sources':'session',
            \ 'commands' : ['UniteSessionSave', 'UniteSessionLoad']}}
NeoBundleLazy 'tsukkee/unite-help', {'autoload':{'unite_sources':'help'}}
NeoBundleLazy 'ujihisa/unite-colorscheme', {'autoload':{'unite_sources':
            \ 'colorscheme'}}
NeoBundleLazy 'ujihisa/unite-locate', {'autoload':{'unite_sources':'locate'}}
NeoBundleLazy 'thinca/vim-unite-history', { 'autoload' : { 'unite_sources' :
            \ ['history/command', 'history/search']}}
NeoBundleLazy 'osyo-manga/unite-filetype', { 'autoload' : {'unite_sources' :
            \ 'filetype', }}
NeoBundleLazy 'osyo-manga/unite-quickfix', {'autoload':{'unite_sources':
            \ ['quickfix', 'location_list']}}
NeoBundleLazy 'osyo-manga/unite-fold', {'autoload':{'unite_sources':'fold'}}
NeoBundleLazy 'tacroe/unite-mark', {'autoload':{'unite_sources':'mark'}}
" }}}

" Colorschemes {{{

" Dark themes
" Improved terminal version of molokai, almost identical to the GUI one
NeoBundle 'joedicastro/vim-molokai256'

NeoBundle 'tomasr/molokai'
NeoBundleLazy 'sjl/badwolf', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}
NeoBundleLazy 'nielsmadan/harlequin', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}


" Light themes
NeoBundleLazy 'vim-scripts/summerfruit256.vim', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}
NeoBundleLazy 'joedicastro/vim-github256', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}
NeoBundleLazy 'vim-scripts/pyte', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}
NeoBundleLazy 'altercation/vim-colors-solarized', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}

" Make terminal themes from GUI themes
NeoBundleLazy 'godlygeek/csapprox', { 'autoload' :
        \ { 'commands' : ['CSApprox', 'CSApproxSnapshot']}}

" }}}

NeoBundle 'Shougo/vimfiler'
NeoBundleLazy 'scrooloose/syntastic'

" Text editing {{{

" Autocompletion of (, [, {, ', ", ...
NeoBundle 'delimitMate.vim'
" Smart and fast date changer
NeoBundle 'tpope/vim-speeddating'
" to surround vim objects with a pair of identical chars
NeoBundle 'tpope/vim-surround'
" extend repetitions by the 'dot' key
NeoBundle 'tpope/vim-repeat'
" toggle comments
NeoBundle 'tpope/vim-commentary'
" Handy key mappings
NeoBundleLazy 'tpope/vim-unimpaired'
" browse the vim undo tree
NeoBundleLazy 'sjl/gundo.vim', { 'autoload' : {'commands': 'GundoToggle'}}
" marks admin
NeoBundle 'kshenoy/vim-signature'
" multiple cursors
NeoBundle 'terryma/vim-multiple-cursors'
" nice fonts
NeoBundle 'Lokaltog/powerline-fonts'

" }}}

" GUI {{{

" A better looking status line
NeoBundle 'bling/vim-airline'
" Zooms a window
NeoBundleLazy 'vim-scripts/zoomwintab.vim', {'autoload' :
            \{'commands' : 'ZoomWinTabToggle'}}
" easily window resizing
NeoBundle 'jimsei/winresizer'
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h12

" }}}

" VIM Setup {{{ ===============================================================

" <Leader> & <LocalLeader> mapping {{{

let mapleader=','
let maplocalleader= ' '

" }}}

" Airline {{{


set noshowmode

let g:airline_theme='powerlineish'
let g:airline_enable_branch=1
let g:airline_powerline_fonts=1
let g:airline_detect_whitespace = 1
let g:airline#extensions#hunks#non_zero_only = 1

" }}}

" }}}

filetype plugin indent on     " Required!

" Installation check.
NeoBundleCheck
