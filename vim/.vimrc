set nocompatible
set backspace=indent,eol,start
let mapleader=','

"---------------Plugins-------------"
"Install Vundle - git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'vimwiki/vimwiki'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.com'

call vundle#end()
filetype plugin indent on
"---------------Visuals-------------"
colorscheme desert
set number
syntax enable

"---------------Splits--------------"
set splitbelow
set splitright

"---------------Search--------------"
set hlsearch
set incsearch

"--------------Mappings-------------"
"Edit vimrc file"
nmap <Leader>ev :tabedit $MYVIMRC<cr> 
"Remove highlight search"
nmap <Leader><space> :nohlsearch<cr>
"Toggle Nerd Tree"
nmap <C-b> :NERDTreeToggle<cr>
"--------------Auto-Commands--------"
"Automatically source the Vimrc file on save"
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
