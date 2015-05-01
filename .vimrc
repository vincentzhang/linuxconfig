" this is the vim settings of vincent's workspace
" enable file type detection
filetype off
execute pathogen#infect()

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

syntax enable
syntax on
" select color scheme from /usr/share/vim/vim73/colors/
colorscheme desert
" colorscheme peachpuff
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
