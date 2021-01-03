set nocompatible
let mapleader=' '
set clipboard=unnamed "Vim unnamed clipboard to a system clipboard
set termguicolors
colorscheme desert
"---------------Visuals-------------
"Line numbers
set relativenumber					    
"Syntax Highlighting
syntax enable
"Gray out comments
highlight comment ctermfg=grey 
highlight LineNr ctermfg=blue
" On pressing tab, insert 2 spaces
set tabstop=2 softtabstop=2 shiftwidth=2 
set expandtab
set autoindent

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
nmap <Leader>v :tabedit $MYVIMRC<cr>
" Toggle higlight search
nmap <F3> :set hlsearch!<cr>		 	
" File explorer
nmap <C-e> :Lexplore<CR>
" Save file
nmap <Leader>w :w<cr>
" Quit
nmap <Leader>q :q<cr>

"Automatically source the Vimrc file on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
"Automatically compile .tex files on save
augroup autocompiletex
  autocmd!
  autocmd BufWritePost *.tex :!pdflatex % 
augroup END
"---------------Mapping for russian keyboard
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .

map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
