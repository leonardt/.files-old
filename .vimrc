call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

Plug 'JuliaLang/julia-vim'
Plug 'ervandew/supertab'
Plug 'justinmk/vim-sneak'
Plug 'Raimondi/delimitMate'
" Plug 'wellle/targets.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'chriskempson/base16-vim'
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set background=dark
let g:hybrid_custom_term_colors = 1
colorscheme hybrid
" hi Normal ctermbg=None
" let g:lightline = { 'colorscheme': 'hybrid' }
let g:airline_theme = 'hybridline'
let g:airline_powerline_fonts = 1
set laststatus=2

set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set tabstop=4
set backspace=indent,eol,start
set history=1000

set cursorline

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

set autoindent
set smartindent
set hidden

set incsearch
set ignorecase
set smartcase

nnoremap <C-p> :Files<CR>
