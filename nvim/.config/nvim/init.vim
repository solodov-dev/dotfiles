"Basic
set number 				
set hidden 				
set path+=**	
set wildmenu			
set wildignore+=**/node_modules/**
let mapleader="," 			
set noshowmode "Don't show the default --INSERT--; No duplicate with vim-airline

"Remaps 
let mapleader="," 			
nnoremap <leader>v :e $MYVIMRC<cr>	
nnoremap <leader>w :w<cr>		
nnoremap <leader>q :bd<cr>
nnoremap <leader>t :term<cr>
map <F3> :nohl<cr>			
nmap <F8> :TagbarToggle<cr>			
map <C-b> :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFind<cr>
nnoremap <leader>F :Ag 
map <C-p> :GFiles<cr>

"Terminal
tnoremap <Esc> <C-\><C-n> :bd!<cr>

"Autocommands
autocmd! BufWritepost $MYVIMRC source $MYVIMRC "source rc file after update

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
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
call plug#end()

"Coc extentions
let g:coc_global_extensions = ['coc-tsserver']

"Visual
set background=dark
set termguicolors
colorscheme gruvbox
