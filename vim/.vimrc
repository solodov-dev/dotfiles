"-------------------Before installation-----------------
"Before installing vim and all the plugins:
"1. Install Vim-Plug manager: 
" 	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"2. Install fzf: Fuzzy finder for shell
"3. Install Ag(Silver searcher): A code searching tool
"-------------------------------------------------------
set nocompatible
let mapleader=','

"---------------Vundle-------------"
filetype off
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'			"Statusbar
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'		"Theme
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'

call plug#end()
filetype plugin indent on

"---------------Visuals-------------
set number					"Line numbers
syntax enable					"Syntax Highlighting
colorscheme solarized				"Default Colorscheme
set background=dark
set laststatus=2				"Show lightline statusbar
set noshowmode					"Dont show the default mode information
let g:lightline = {				
	\ 'colorscheme': 'wombat',
      	\ }					"Statusbar theme
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
"---------------Splits--------------
set splitbelow
set splitright

"---------------Search--------------
set hlsearch
set incsearch

"--------------Mappings-------------
" Edit vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>
" Toggle higlight search
nmap <F3> :set hlsearch!<cr>		 	
" Close tab
nmap <C-w> :tabc<cr>			 	
" File explorer
nmap ge :CocCommand explorer<CR>
"-----------FZF Mappings
" Search files (Ctrl-p)
nmap <C-p> :Files<cr>				
" Find symbol in current file
nmap <C-o> :BLines<cr>				
" Find symbols in files
nmap <C-f> :Ag<cr>				
"-----------COC mappings
function! s:check_back_space() abort
	let col=col('.') - 1
	return !col || getline('.')[col - 1] =- '\s'
endfunction
inoremap <silent><expr> <Tab>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"--------------Auto-Commands--------
augroup autosourcing				"Automatically source the Vimrc file on save
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
