"=============================================================="
"                                                              " 
"     ███████╗██████╗     ███╗   ██╗██╗   ██╗██╗███╗   ███╗    "
"     ██╔════╝██╔══██╗    ████╗  ██║██║   ██║██║████╗ ████║    "
"     ███████╗██║  ██║    ██╔██╗ ██║██║   ██║██║██╔████╔██║    "
"     ╚════██║██║  ██║    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║    "
"     ███████║██████╔╝    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║    "
"     ╚══════╝╚═════╝     ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝    "
"                                                              " 
"       Solodov dev                  init.vim                  " 
"                                                              " 
"=============================================================="

"=============================================================" 
"                         OUTLINE                             " 
"============================================================="
"
" PLUGINS
" GLOBALS
" OPTIONS
" REMAPS
" COMMANDS
" AUTOCOMMANDS
" COC

"=============================================================" 
"                         PLUGINS                             " 
"============================================================="

" Install vim-plug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
call plug#end()

"=============================================================" 
"                             GLOBALS                         " 
"============================================================="

" NERDTree replace arrows
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeCustomOpenArgs = {'file': {'reuse': 'all', 'where': 'p', 'keepopen': 1, 'stay': 1}}

" NertTree highlight filenames
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 
let g:NERDTreeHighlightFoldersFullName = 1 

" WebdevIcons refresh
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

" Airline setup
" Show buffers
let g:airline#extensions#tabline#enabled=1

" Theme
let g:airline_theme='deus'

" If no dictionary for powerline symbols - create one
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

"Coc extentions
let g:coc_global_extensions = [
	\'coc-tsserver',
	\'coc-emmet',
	\'coc-json',
	\'coc-css',
	\'coc-snippets',
	\'coc-eslint',
	\'coc-prettier',
	\]

" If prettier and eslint are present in node_modules folder 
" run coc extentions
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.md,*.ts'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,tsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
 " Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

"=============================================================" 
"                         OPTIONS                             " 
"============================================================="

" Turn on syntax highlighting
syntax on
" Turn off line wrapping
set nowrap
" Turn on line numbers
set number
" Turn on relative line numbers
set relativenumber 				
" Mor space for commands
set cmdheight=2
" Hide buffer, but don't close it on loosing focus
set hidden 				
" Turn on command line completion
set wildmenu			
" Deep search
set path+=**	
" Ignore node modules directory
set wildignore+=**/node_modules/**
" Don't show the default --INSERT--; No duplicate with vim-airline
set noshowmode 
" When indenting with '>', use 2 spaces
set shiftwidth=2
" On pressing tab, insert two spaces
set expandtab
" Show existing tab with 2 spaces width
set tabstop=2 softtabstop=2
" Turn on vim's automatic indenting
set smartindent
" Set leader key
let mapleader=" " 			
" Theme
colorscheme gruvbox
" Background
set background=dark
" Enable 24-bit RGB color
set termguicolors
" Some servers have issues with backup files
set nobackup
set nowritebackup
" Always show the sign column
set signcolumn=yes
" Highlight matching parenthesis
set showmatch
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Highlight current line
set cursorline
" Ignore case in search
set ignorecase
" Unless includes capital
set smartcase
" Include tags from '.git/tags'
set tags^=./.git/tags;
"=============================================================" 
"                             REMAPS                          " 
"============================================================="

" Edit vimrc file
nn <leader>v :e $MYVIMRC<cr>	
nn <leader>w :w<cr>		
nn <leader>q :bd<cr>

" Close other buffers
nn <leader>oq :%bd\|e#\|bd#<cr>

" Close all buffers
nn <leader>aq :%bd<cr>
nn <leader>F :Ag 
nn gt :bn<cr> 
nn gT :bp<cr> 

" Turn off highlighting
map <F3> :nohl<cr>			

" NERDTree toggle
map <silent> <C-b> :NERDTreeToggle<cr>
nn  <silent> <C-e> :NERDTreeFind<cr>

" Search files 
map <silent> <C-p> :GFiles --cached --others --exclude-standard<cr>

" Search in files
" map <silent> <leader>f :Ag <cr>

" Git commands
nn <silent> <leader>gs :vertical Gstatus<cr>
nn <leader>gp :Gpush<cr>
nn <leader>gP :Gpull<cr>
nn <leader>gd :Gdiffsplit!<CR>
nn <leader>gf :diffget //2<CR>
nn <leader>gj :diffget //3<CR>

" Copy to system clipboard
vn  <leader>y  "+y
nn  <leader>Y  "+yg_
nn  <leader>y  "+y
nn  <leader>yy  "+yy

" Paste from system clipboard
nn <leader>p "+p
nn <leader>P "+P
vn <leader>p "+p
vn <leader>P "+P

" Open terminal to the right
nn <leader>t :vs<bar>:terminal<cr>:wincmd L<cr>


"=============================================================" 
"                         AUTOCOMMANDS                        " 
"============================================================="

" Source .rc file after update
autocmd! BufWritepost $MYVIMRC source $MYVIMRC 

" Don't show signcolumn in a nerdtree window
autocmd FileType nerdtree setlocal signcolumn=no

" Hide numbers in terminal buffer
autocmd TermOpen * setlocal nonumber norelativenumber

" Exit terminal mode (do not interfere with fzf esc behavior)
if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif

"=============================================================" 
"                              COC                            " 
"============================================================="

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <F2> <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>af  <Plug>(coc-fix-current)


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OrganizeImports` command for organize imports of the current buffer.
command! -nargs=0 OrganizeImports :call CocAction('runCommand', 'editor.action.organizeImport')

" Show definitions on hover
nnoremap <silent> gh :call CocAction('doHover')<CR>

" Show coc diagnostics list
nnoremap <silent> <leader>d :<C-u>CocList diagnostics<cr>
