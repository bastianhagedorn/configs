set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'rhysd/vim-clang-format'
Plugin 'petrushka/vim-opencl'
Plugin 'scrooloose/nerdtree'


call vundle#end()
filetype plugin indent on

" Powerline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
set laststatus=2
set t_Co=256
set encoding=utf-8

if !exists('g:airline_symbols')
				let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'
"
" " airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

" ClangFormat
" use :ClangFormatAutoToggle to toggle automatic formatting
let g:clang_format#auto_format = 0
let g:clang_format#code_style = "llvm"
let g:clang_format#style_options = {
												\ "ColumnLimit" : 100,
												\ "AllowShortIfStatementsOnASingleLine" : "true"}

" General
set number
"set nowrap
set tabstop=4               "number of visual spaces per TAB
set softtabstop=4           "number of spaces a tabs counts for
set expandtab               "tabs are spaces
set cursorline              
set wildmenu                "graphical menu for autocompletion
set showmatch               "shows matching brackets
set incsearch               "search as characters are entered
set hlsearch                "highlight matches
"experimental
set ai                      "auto indentation
set si                      "smart indent
set ru                      "turn on ruler
"turn of hlsearch with comma-space
let mapleader = ","
nmap <leader><space> :nohlsearch<cr> 
syntax enable
set background=light
colorscheme solarized

nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$
" jk is escape 
inoremap jk <esc> 

" spell
autocmd BufNewFile,BufRead *.tex setlocal spell spelllang=en_us 
autocmd BufNewFile,BufRead *.tex syntax spell toplevel
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=red
hi clear SpellLocal
hi SpellLocal cterm=underline,bold ctermfg=red
let g:tex_comment_nospell=1
let g:tex_verbspell=1

" trim trailing whitespaces when saving file
fun! TrimWhitespace()
				let l:save = winsaveview()
				%s/\s\+$//e
				call winrestview(l:save)
endfun

autocmd BufWrite *.tex :call TrimWhitespace()

" NERDTree
let mapleader = ","
nmap <leader>nt :NERDTree<cr>

" move between windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" highlight cls files as tex files
au BufNewFile,BufRead *.cls set filetype=tex
