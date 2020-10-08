set number 				"show line numbers
set hidden 				"don't prompt to save files when opening another file
let mapleader="," 			"set your leader key

" Remaps 
nnoremap <Leader>v :e $MYVIMRC<cr>	"edit source file
nnoremap <Leader>w :w<cr>		"save file
nnoremap <Leader>q :q<cr>		"save file

" Autocommands
autocmd! BufWritepost $MYVIMRC source $MYVIMRC
