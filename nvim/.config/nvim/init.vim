"Basic
set number 				
set hidden 				
set path+=**				
set wildmenu			
set wildignore+=**/node_modules/**
let mapleader="," 			

"Remaps 
nnoremap <leader>v :e $MYVIMRC<cr>	
nnoremap <leader>w :w<cr>		
nnoremap <leader>f :find 
nnoremap <leader>q :bd<cr>
nnoremap <leader>t :term<cr>
map <F3> :nohl<cr>			
nmap <F8> :TagbarToggle<cr>			
map <C-b> :NERDTreeToggle<cr>
map <C-p> :GFiles<cr>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"Terminal
tnoremap <Esc> <C-\><C-n> :bd!<cr>

"Autocommands
autocmd! BufWritepost $MYVIMRC source $MYVIMRC

"Install vim-plug if not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"Plugins
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
call plug#end()

set background=dark
colorscheme gruvbox
