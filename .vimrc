set nocompatible               		        " required
filetype off	                	        " required
set rtp+=~/.vim/bundle/Vundle.vim

" -------------- Beginning of the Plugin Manager section --------------

call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"--------------- Внешний вид -------------

Plugin 'mhartington/oceanic-next'           " Color theme
Plugin 'sonph/onehalf', { 'rtp': 'vim' }    " Color theme
Plugin 'sjl/badwolf'                        " Color theme

"--------------- Vim Airline status bar -------------

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"--------------- Nerd Tree file manager -------------

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

"--------------- Working with code -------------

"------ Django ------
Plugin 'tweekmonster/django-plus.vim'

"------ Python ------
Plugin 'python-mode/python-mode'            " https://github.com/python-mode/python-mode
					    " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim'               " Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'                " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'	    " Combined Python 2/3 for Vim
Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
Plugin 'tmhedberg/SimpylFold'               " Groups the code parts
Plugin 'vim-scripts/indentpython.vim'       " Adjusts indentation by PEP 8
Plugin 'vim-syntastic/syntastic'            " Code syntax checking plugin 
Plugin 'nvie/vim-flake8'                    " Syntax and style checker for Python through Flake8
Plugin 'ycm-core/YouCompleteMe'             " A code-completion engine
Plugin 'tpope/vim-fugitive'                 " Plugin for Git
Plugin 'frazrepo/vim-rainbow'               " Closes open brackets, quotes
Plugin 'ctrlpvim/ctrlp.vim'                 " Full path fuzzy file, buffer, mru, tag, ... finder for Vim


call vundle#end()			    " required
filetype plugin indent on   		    " required

" -------------- End of the plugin manager section --------------

"---------------=== System settings ===-------------

set nu                                      " show line numbers
syntax on	                            " enable code highlighting
set cursorline				    " highlight the active line
set encoding=UTF-8                          " utf-8 by default in the files
set incsearch 	                            " realtime highlighting 1st search word
set hlsearch                                " search results highlighting
set scrolloff=5                             " 5 lines at a time when scrolling
set nobackup                                " disabling file backup in vim
set nowritebackup    		            " disable backup of editable files
set noswapfile       			    " Disable swap files
set novisualbell                            " turn off flashing
set visualbell t_vb=                        " turn off the squeaker 
set guioptions-=m  		 	    " hide menu
set guioptions-=T    			    " hide the toolbar
set guioptions-=r   			    " hide scrollbars

set smarttab			            " turn on smart indents
set expandtab                               " replace Tabs with spaces 
set tabstop=4	 	                    " set number of spaces per Tab
set softtabstop=0
set shiftwidth=4

set laststatus=0                            " do not show the last commands in the status bar
filetype plugin on

"---------------=== Color Settings ===-------------

colorscheme onehalfdark 	 	    " design theme ':colorscheme'
set t_Co=256 				    " color adjustment for vim 7 

if (has("termguicolors"))		    " color adjustmentfor vim 8
		set termguicolors
endif

if exists('+termguicolors')		            " enable true colors (24 bit)
		let &t_8f = "\[38;2;%lu;%lu;%lum"
		let &t_8b = "\[48;2;%lu;%lu;%lum"
      	set termguicolors
endif

"---------------=== Vim-Airline color theme settings ===-------------

" https://github.com/vim-airline/vim-airline/blob/master/doc/airline.txt

let g:airline_theme='base16_bright'                 " color theme
let g:airline#extensions#wordcount#disabled = 1     " disable word count
let g:airline_section_z = '☵  %1l/%L/%v'            " setting up the rows section
let g:airline_section_warning = ''                  " disable the error output section
let g:airline#extensions#tabline#enabled = 1        " enable tabs
let g:airline#extensions#tabline#tabs_label = ''    " remove the word Tabs in the left corner
let g:airline#extensions#tabline#fnamemod = ':t'    " only the name of the files on the tab
let g:airline#extensions#tabline#show_tab_count = 0 " do not show the number of tabs in the right corner
let g:airline#extensions#tabline#show_tab_nr = 0    " not to show clutch numbers 

"---------------=== Remove VIM background ===-------------

" removing the background
hi NonText ctermbg=none
hi Normal guibg=NONE ctermbg=NONE
" remove the background of the line numbers
hi LineNr guibg=NONE                                

"---------------=== Working with code ===-------------

" Highlight the code that exceeds the 80-character limit (Ruby / Python / js / C / C++)
augroup vimrc_autocmds
		autocmd!
		autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
		autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
		autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

"---------------=== Python-mode ===-------------

let g:pymode_rope = 1                        " Enabling the Rope library
let g:pymode_lint = 1                        " Enabling linting
let g:pymode_lint_checker = "pyflakes,pep8"  " Which errors to highlight
let g:pymode_lint_cwindow = 0                " Turning off the annoying error and warning window
let g:pymode_virtualenv = 1                  " Enabling virtualenv support
" Syntax and error highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_folding = 0                     " Disabling Folding
let g:pymode_breakpoint = 1                  " Download the plugin for inserting breakpoints
let g:pymode_breakpoint_key = 'e'            " Hot-key to set up a breakpoint

"---------------=== Code grouping (class, def и т. п.) ===-------------

set foldmethod=syntax
set foldnestmax=10
set foldlevel=99
set nofoldenable

" Hotkey 'Spacebar'
nnoremap  za

"---------------=== Splitting the screen ===-------------

" :vs /way/to/file vertical division
" :sp /way/to/file horizontal division

set splitright                              " split vertically to the right
set splitbelow				    " split horizontally from the bottom

" нnavigation on the split screen
nnoremap   
nnoremap  
nnoremap  
nnoremap  

"---------------=== Tabs ===-------------

" Next tab / Previous tab
map  gt
map  gT

"---------------=== ctrlp Search, open files ===-------------

" Run :CtrlP or :CtrlP [starting-directory] to invoke CtrlP in find file mode.
" Run :CtrlPBuffer or :CtrlPMRU to invoke CtrlP in find buffer or find MRU file mode.
" Run :CtrlPMixed to search in Files, Buffers and MRU files at the same time.
" Check :help ctrlp-commands and :help ctrlp-extensions for other commands.

" Press  to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
" Press  and  to cycle between modes.
"  Press  to switch to filename only search instead of full path.
"  Press  to switch to regexp mode.
"  Use ,  or the arrow keys to navigate the result list.
"  Use  or ,  to open the selected entry in a new tab or in a new split.
"  Use ,  to select the next/previous string in the prompt's history.
"  Use  to create a new file and its parent directories.
"  Use  to mark/unmark multiple files and  to open them.

"---------------=== NerdTree settings ===-------------

let NERDTreeIgnore=['\.pyc$', '\~$'] 	            " ignore file types
let g:NERDTreeDirArrowExpandable = '›' 	            " own signs
let g:NERDTreeDirArrowCollapsible = '–'             " own signs

" On/Off hotkey 'Ctr + n'

map  :NERDTreeToggle
