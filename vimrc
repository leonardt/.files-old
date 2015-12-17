" Plugins {{{
call plug#begin('~/.vim/plugged')
" Completion {{{
" if has('nvim')
"     Plug 'Shougo/deoplete.nvim'
"     Plug 'Shougo/neco-syntax'
" else
    Plug 'ervandew/supertab'
" endif
" }}}
" General {{{
Plug 'szw/vim-ctrlspace'

Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'junegunn/vim-easy-align'
" }}}
" Movement {{{
Plug 'justinmk/vim-sneak'
Plug 'christoomey/vim-tmux-navigator'
" }}}
" Search {{{
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'thinca/vim-qfreplace'
" Plug 'osyo-manga/vim-over'
" Plug 'junegunn/vim-pseudocl'
" Plug 'junegunn/vim-oblique'
" }}}
" Languages {{{
Plug 'JuliaLang/julia-vim'
Plug 'benekastah/neomake'
Plug 'zyedidia/julialint.vim'
" }}}
" UI {{{
Plug 'NLKNguyen/papercolor-theme'
Plug 'w0ng/vim-hybrid'
Plug 'junegunn/goyo.vim'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'whatyouhide/vim-gotham'

Plug 'bling/vim-airline'
" }}}
call plug#end()
" }}}
" General Settings {{{
" set background=light
" colorscheme PaperColor
" let g:airline_theme = "PaperColor"
let g:hybrid_use_Xresources = 1
" set background=dark
" colorscheme hybrid
" let g:airline_theme = "hybridline"
" hi StatusLine ctermbg=6 ctermfg=16
" hi StatusLineNC ctermbg=6 ctermfg=0
" let g:airline_theme = "monochrome"
" let base16colorspace=256
"
fun! LoadGruvboxDark()
    set background=dark
    colorscheme gruvbox
    let g:airline_theme = "gruvbox"
endfun

fun! LoadPaperColor()
    set background=light
    colorscheme PaperColor
    let g:airline_theme = "PaperColor"
endfun

fun! LoadGotham()
    set background=dark
    colorscheme gotham
    let g:airline_theme = "gotham"
endfun

" call LoadGruvboxDark()
" call LoadGotham()
call LoadPaperColor()
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''

let mapleader = "\<Space>"

set number
" set relativenumber

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

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

set noshowmode
set hidden

set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·
set fcs=vert:│

if has('nvim')
    tnoremap <Esc> <c-\><c-n>
elseif exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
end
" }}}

autocmd FileType julia setlocal commentstring=#\ %s
autocmd FileType c,cpp setlocal commentstring=//\ %s
" Return to line when reopening file
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Save when losing focus
au FocusLost * :silent! wall

fun! StripTrailingWhiteSpace()
  " don't strip on these filetypes
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfun
" autocmd bufwritepre * :call StripTrailingWhiteSpace()

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

" let g:latex_to_unicode_tab = 0
" let g:latex_to_unicode_auto = 1

" deoplete {{{
" if has('nvim')
"     let g:deoplete#enable_at_startup = 1
"     let g:deoplete#enable_smart_case = 1
"     inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
"     inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
"     inoremap <expr><BS>
"         \ deoplete#mappings#smart_close_popup()."\<C-h>"
"     set completeopt+=noselect
"     " let g:deoplete#omni_patterns = {}
"     " let g:deoplete#omni_patterns.julia = '\\\w*'
" end
" }}}

" Backups, History, and Undo {{{

set history=1000
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

if has('persistent_undo')
  set undofile
  set undoreload=10000
  set undodir=~/.vim/tmp/undo/     " undo files
  if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
  endif
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

nnoremap <Leader>a :Ack<Space>

" ctrlp {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
nnoremap <leader>t :CtrlPTag<CR>
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
elseif executable('ack')
  let g:ctrlp_user_command =
    \ 'ack %s -f --follow --nofilter'
  let g:ctrlp_use_caching = 0
" else
"   " Fall back to using git ls-files if Ag is not available
"   let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
"   let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif
" " }}}

let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
