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
set backupcopy=yes                "This setting is for webpack dev server

"---------------Vundle-------------"
filetype off
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'			"Statusbar
Plug 'tpope/vim-surround'
Plug 'dracula/vim'		            "Theme
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Coc extensions
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-json', 
  \ 'coc-snippets', 
  \ 'coc-tsserver', 
  \ 'coc-eslint',
  \ 'coc-tslint',
  \ 'coc-pairs', 
  \ 'coc-python', 
  \ 'coc-sh', 
  \ 'coc-emmet', 
  \ 'coc-webpack', 
  \ 'coc-prettier', 
  \ 'coc-html', 
  \ 'coc-vetur', 
  \ 'coc-svg', 
  \ 'coc-markdownlint', 
  \]
call plug#end()
filetype plugin indent on

"---------------Visuals-------------
set number					    "Line numbers
syntax enable					  "Syntax Highlighting
set background=dark
set laststatus=2				"Show lightline statusbar
set noshowmode					"Dont show the default mode information
let g:lightline = {				
	\ 'colorscheme': 'wombat',
      	\ }					    "Statusbar theme
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
"--------------netrw style
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_altv = 1

"---------------Search--------------
set hlsearch
set incsearch

"--------------Mappings-------------
"--------------Global
" Edit vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>
" Edit snippets for current file
nmap <Leader>es :CocCommand snippets.editSnippets<cr> 
" Toggle higlight search
nmap <F3> :set hlsearch!<cr>		 	
" File explorer
nmap <C-e> :Lexplore<CR>
" Save file
nmap <Leader>w :w<cr>
" Quit
nmap <Leader>q :q<cr>

"-----------FZF Mappings
" Search files (Ctrl-p)
nmap <C-p> :GFiles<cr>				
" Find symbol in current file
nmap <C-o> :BLines<cr>				
" Find symbols in files
nmap <C-f> :Ag<cr>				

"-----------COC mappings
"Configure completion with tab
function! s:check_back_space() abort
	let col=col('.') - 1
	return !col || getline('.')[col - 1] =- '\s'
endfunction
inoremap <silent><expr> <Tab>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()
"Scroll through completions with tab ans shift-tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"Choose the completion with CR
 inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
"Coc prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"--------------Auto-Commands--------
augroup autosourcing				"Automatically source the Vimrc file on save
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
