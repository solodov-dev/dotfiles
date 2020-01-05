set nocompatible
set backspace=indent,eol,start
let mapleader=','

"---------------Vundle-------------"
"Install Vundle - git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'			"Package manager
Plugin 'vimwiki/vimwiki'			"Wiki
Plugin 'scrooloose/nerdtree'			"Tree file manager
Plugin 'itchyny/lightline.vim'			"Statusbar
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'			"Git plugin
Plugin 'altercation/vim-colors-solarized'	"Theme
Plugin 'mxw/vim-jsx'
Plugin 'w0rp/ale'				"Linting
Plugin 'mattn/emmet-vim'
Plugin 'posva/vim-vue'
Plugin 'tpope/vim-repeat'
Plugin 'junegunn/fzf'

call vundle#end()
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
"---------------Splits--------------
set splitbelow
set splitright

"---------------Search--------------
set hlsearch
set incsearch

"--------------Mappings-------------
nmap <Leader>ev :tabedit $MYVIMRC<cr> 		"Edit vimrc file
nmap <C-b> :NERDTreeToggle<cr>                  "Toggle Nerd Tree
nmap <F3> :set hlsearch!<cr>		 	"Toggle highlight search

"--------------Auto-Commands--------
augroup autosourcing				"Automatically source the Vimrc file on save
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
