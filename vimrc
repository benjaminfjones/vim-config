"""""""""""
" GLOBALS "
"""""""""""

set nocompatible

" Set the leader as ';' instead of '\\'
let mapleader      = ";"
let maplocalleader = ";"

let $VIMHOME = $HOME . '/.vim'

"""""""""""
" BUNDLES "
"""""""""""

filetype off

set rtp+=$VIMHOME/bundle/vundle/
call vundle#rc($VIMHOME . '/bundle')

" Vundle
Bundle 'gmarik/vundle'

" External packages
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/vimwiki'
Bundle 'samsonw/vim-task'
Bundle 'https://github.com/vim-scripts/closetag.vim.git'

" Tabular
Bundle 'godlygeek/tabular'
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>


" Indenting
Bundle 'IndentAnything'
Bundle 'scrooloose/syntastic'
Bundle 'elliottt/haskell-indent'

" NERDTree config
Bundle 'scrooloose/nerdtree'

" Powerline config
Bundle 'Lokaltog/vim-powerline'
set laststatus=2
" let g:Powerline_symbols = 'fancy'


"""""""""""""""""""""""
" POST BUNDLE OPTIONS "
"""""""""""""""""""""""

" Enable filetype detection
filetype plugin indent on

set ignorecase smartcase

" Allow backspacing over everything
set backspace=indent,eol,start

" Incremental searching
set incsearch

" Cursor context
set scrolloff=3

" Define double <leader> to kill the search highlighting.
map <Leader><Leader> :noh<Enter>

" Always show cursor position
set ruler

" Fold by manually defined folds
set foldenable

" Syntax
if &t_Co > 2 || has("gui_running")
    syntax enable
    set hlsearch
endif

" Spell checking
if has("spell")
    setlocal spell spelllang=en_us
    set nospell
endif

" Highlight lines longer than 80 chars
let w:m80=matchadd('ErrorMsg', '\%>80v.\+', -1)
set textwidth=80

" Highlight trailing space, and tab characters, toggle with <leader>-s
set list lcs=tab:>-,trail:.
nmap <leader>s :set nolist!<CR>

" Completion options
set wildmode=longest:full,list:full
set wildmenu
set wildignore=*.o,*.hi,*.swp,*.bc

" Colors!
colors default
set bg=dark

" Disable the arrow keys when in edit mode
inoremap <Up>    <NOP>
inoremap <Right> <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>

" Set F2 as the binding to toggle the paste mode
set pastetoggle=<F2>

" Disable the bell
set noerrorbells
set visualbell
set t_vb=

" Map <Leader>s to sort the visual selection
vmap <Leader>s :sort<Cr>

" Always expand tabs to spaces
set expandtab
set tabstop=4
set shiftwidth=4

" turn on cursor crosshairs with <Leader>c
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>


"""""""""
" macros
"""""""""

let @h = "yypVr"
let @q = "{!}fmt"
let @w = ":%s/\\s+$//"
let @p = ":w !pbcopy"
:nnoremap <Leader>w :%s/\s\+$//<CR>
:nnoremap <Leader>p :w !pbcopy<CR><CR>
