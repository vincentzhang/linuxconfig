" this is the vim settings of vincent's workspace
" enable file type detection
set nocp
filetype off
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set showcmd
set timeoutlen=200 "define the delay of the lead key
set backspace=indent,eol,start
set nu

au BufNewFile,BufRead *.py
    \ set tabstop=42|
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

let mapleader=" "

" Highlight trailing whitespaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

syntax enable
syntax on

"let g:pymode_python = 'disable'
" PYMODE settings
"let g:pymode_rope_lookup_project = 0
"let g:pymode_rope = 0
"let g:pymode_rope_complete_on_dot = 0

" select color scheme from /usr/share/vim/vim73/colors/
let base16colorspace=256  " Access colors present in 256 colorspace
"colorscheme desert
"colorscheme base16-default-dark
colorscheme base16-ocean
"colorscheme base16-google-dark
"colorscheme base16-onedark
" colorscheme elflord
match ExtraWhitespace /\s\+$\| \+\ze\t/

autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
autocmd VimEnter * redraw!

" key mapping
:map <F9> :tabn<CR>
:map <F10> :tabp<CR>
:map <F5> :bn<CR>
:map <F6> :bp<CR>

" for tagbar plugin
" ctags
let g:tagbar_ctags_bin='/usr/bin/ctags'
nmap <F8> :TagbarToggle<CR>

" type \tl to switch to the last active tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" tab easy switching
set wildchar=<Tab> wildmenu wildmode=full

" enable vim-ragtag
" general purpose mapping
" let g:ragtag_global_maps = 1

" enable ctrlp plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim

" powerline
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
"
" Always show statusline
set laststatus=2
"
" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" YouCompleteMe settings
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" For SimpleFold
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
