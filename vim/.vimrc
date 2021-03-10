"---------------Basics--------------
syntax enable
set nocompatible
set clipboard=unnamed
set number relativenumber					    
set tabstop=2 softtabstop=2 shiftwidth=2 
set hlsearch incsearch
set expandtab
set autoindent
let mapleader=' '
set showtabline=0
colorscheme slate

"--------------Globals--------------
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_altv = 1

"--------------Mappings-------------
nmap <Leader>v :tabedit $MYVIMRC<cr>
nmap <F3> :set hlsearch!<cr>		 	
nmap <C-e> :Lexplore<CR>

"Automatically source the Vimrc file on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
