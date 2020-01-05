"-------------------Before installation-----------------
"Before installing vim and all the plugins:
"1. Install Vundle manager: 
"2. Install fzf: Fuzzy finder for shell
"3. Install Ag(Silver searcher): A code searching tool
"-------------------------------------------------------
set nocompatible
set backspace=indent,eol,start
let mapleader=','

"---------------Vundle-------------"
filetype off
call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'			"Package manager
Plug 'vimwiki/vimwiki'				"Wiki
Plug 'scrooloose/nerdtree'			"Tree file manager
Plug 'itchyny/lightline.vim'			"Statusbar
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'			"Git plugin
Plug 'altercation/vim-colors-solarized'		"Theme
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

call plug#end()

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
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
"---------------Splits--------------
set splitbelow
set splitright

"---------------Search--------------
set hlsearch
set incsearch

"--------------Mappings-------------
" Edit vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>
" Toggle Nerdtree
nmap <C-b> :NERDTreeToggle<cr>                  
" Toggle higlight search
nmap <F3> :set hlsearch!<cr>		 	
" Close tab
nmap <C-w> :tabc<cr>			 	
"-----------FZF Mappings
" Search files (Ctrl-p)
nmap <C-p> :Files<cr>				
" Find symbol in current file
nmap <C-o> :BLines<cr>				
" Find symbols in files
nmap <C-f> :Ag<cr>				
"--------------Auto-Commands--------
augroup autosourcing				"Automatically source the Vimrc file on save
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
