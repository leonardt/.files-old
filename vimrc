" Plugins {{{
call plug#begin('~/.vim/plugged')
" Completion {{{
Plug 'Shougo/deoplete.nvim'
" }}}
" General {{{
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
" }}}
" Movement {{{
Plug 'justinmk/vim-sneak'
" }}}
" Search {{{
Plug 'mileszs/ack.vim'
Plug 'thinca/vim-qfreplace'
Plug 'osyo-manga/vim-over'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
" }}}
" Languages {{{
Plug 'JuliaLang/julia-vim'
" }}}
" Colorschemes {{{
Plug 'NLKNguyen/papercolor-theme'

Plug 'bling/vim-airline'
" }}}
call plug#end()
" }}}
" General Settings {{{
set background=light
colorscheme PaperColor
let g:airline_theme = "PaperColor"
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

set number

set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set tabstop=4
set backspace=indent,eol,start
set history=1000
set undofile
set undoreload=10000

set autoindent
set smartindent
set hidden

set incsearch
set ignorecase
set smartcase

set cursorline
set noshowmode
set hidden
" }}}
"
" Save when losing focus
au FocusLost * :silent! wall

fun! StripTrailingWhiteSpace()
  " don't strip on these filetypes
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfun
autocmd bufwritepre * :call StripTrailingWhiteSpace()

" Wildmenu completion {{{

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

" }}}

if has('nvim')
    tnoremap <Esc> <c-\><c-n>
    let g:deoplete#enable_at_startup = 1
    inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
    inoremap <expr><BS>
        \ deoplete#mappings#smart_close_popup()."\<C-h>"
end

set history=1000
if has('persistent_undo')
  set undofile
  set undoreload=10000
  set undodir=~/.vim/tmp/undo/     " undo files
  if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
  endif
endif

" Backups {{{

set backup
set noswapfile

set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/

if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

" }}}

" Vim {{{
augroup ft_vim
	au!

	au FileType vim setlocal foldmethod=marker
augroup END
" }}}

" delimitmate {{{
let delimitMate_expand_cr = 1
au FileType python let b:delimitMate_nesting_quotes = ['"']
" }}}

nnoremap <Leader>a :Ag<Space>
