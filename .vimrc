set nocompatible               		        " required
filetype off	                	        " required
set rtp+=~/.vim/bundle/Vundle.vim

" -------------- Начало секции менеджера плагиинов --------------

call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"--------------- Внешний вид -------------

Plugin 'mhartington/oceanic-next'           " Цветовая тема
Plugin 'sonph/onehalf', { 'rtp': 'vim' }    " Цветовая тема
Plugin 'sjl/badwolf'                        " Цветовая тема

"--------------- Vim Airline статусная строка -------------

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"--------------- Nerd Tree файловый менеджер -------------

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

"--------------- Работа с кодом -------------

"------ Django ------
Plugin 'tweekmonster/django-plus.vim'

"------ Python ------
Plugin 'python-mode/python-mode'            " https://github.com/python-mode/python-mode
					                        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim'               " Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'                " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'	    " Combined Python 2/3 for Vim
Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
Plugin 'tmhedberg/SimpylFold'               " Группирует части кода 
Plugin 'vim-scripts/indentpython.vim'       " Регулирует отступы по PEP 8
Plugin 'vim-syntastic/syntastic'            " Code syntax checking plugin 
Plugin 'nvie/vim-flake8'                    " Syntax and style checker for Python through Flake8
Plugin 'ycm-core/YouCompleteMe'             " A code-completion engine
Plugin 'tpope/vim-fugitive'                 " plugin for Git
Plugin 'frazrepo/vim-rainbow'               " Закрывает открытые скобки, кавычки
Plugin 'ctrlpvim/ctrlp.vim'                 " Full path fuzzy file, buffer, mru, tag, ... finder for Vim


call vundle#end()			                " required
filetype plugin indent on   		        " required

" -------------- Конец секции менеджера плагинов --------------

"---------------=== Системные настройки ===-------------

set nu                                      " показывать номера строк
syntax on	                                " включить подсветку кода
set cursorline				                " выделить активную строку
set encoding=UTF-8                          " utf-8 по дефолту в файлах
set incsearch 	                            " realtime highlighting 1st search word
set hlsearch                                " подсветка результатов поиска
set scrolloff=5                             " 5 строк при скролле за раз
set nobackup                                " отключаем резервное копирование файлов в vim
set nowritebackup    		                " отключаем резервное копирование редактируемых файлов
set noswapfile       			            " отключаем swap фалов
set novisualbell                            " отключаем мигание
set visualbell t_vb=                        " отключаем пищалку 
set guioptions-=m  		 	                " скрываем меню
set guioptions-=T    			            " скрываем тулбар
set guioptions-=r   			            " скрываем скроллбары   

set smarttab			                    " включаем умные отступы
set expandtab                               " заменяем Tab-ы пробелами 
set tabstop=4	 	                        " задаем кол-во пробелов в 1 Tab-е
set softtabstop=0
set shiftwidth=4

set laststatus=0                            " не показывать последние команды в статусной строке
filetype plugin on

"---------------=== Настройки цвета ===-------------

colorscheme onehalfdark 	 	            " Тема оформления ':colorscheme'
set t_Co=256 				                " настройка цвета for vim 7 

if (has("termguicolors"))		            " настройка цвета for vim 8
		set termguicolors
endif

if exists('+termguicolors')		            " enable true colors (24 bit)
		let &t_8f = "\[38;2;%lu;%lu;%lum"
		let &t_8b = "\[48;2;%lu;%lu;%lum"
      	set termguicolors
endif

"---------------=== Настройки Vim-Airline цветовые темы ===-------------

" https://github.com/vim-airline/vim-airline/blob/master/doc/airline.txt

let g:airline_theme='base16_bright'                 " цветовая тема
let g:airline#extensions#wordcount#disabled = 1     " отключить кол-во слов
let g:airline_section_z = '☵  %1l/%L/%v'            " настройка секции с строк
let g:airline_section_warning = ''                  " отключить секцию вывода ошибок
let g:airline#extensions#tabline#enabled = 1        " включить вкладки
let g:airline#extensions#tabline#tabs_label = ''    " кбрать слово Tabs в левом углу
let g:airline#extensions#tabline#fnamemod = ':t'    " только имя файлов на вкладке
let g:airline#extensions#tabline#show_tab_count = 0 " не показыать кол-во вкладок справа в углу
let g:airline#extensions#tabline#show_tab_nr = 0    " не показывать номера кладок 

"---------------=== Remove VIM background ===-------------

" убираем фон
hi NonText ctermbg=none
hi Normal guibg=NONE ctermbg=NONE
" убираем фон номеров строк
hi LineNr guibg=NONE                                

"---------------=== Работа с кодом ===-------------

" Подсветка кода вышедшего за границу 80 символов (Ruby / Python / js / C / C++)
augroup vimrc_autocmds
		autocmd!
		autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
		autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
		autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

"---------------=== Python-mode ===-------------

let g:pymode_rope = 1                        " Включаем библиотеку Rope
let g:pymode_lint = 1                        " Включаем linting
let g:pymode_lint_checker = "pyflakes,pep8"  " Какие ошибки подсвечивать
let g:pymode_lint_cwindow = 0                " Отключаем надоедливое окно ошибок и предупреждений
let g:pymode_virtualenv = 1                  " Включаем поддержку virtualenv
" Подсветка синтаксиса и ошибок
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_folding = 0                     " Отключаем фолдинг
let g:pymode_breakpoint = 1                  " Загружаем плагин для вставки брейкпоинтов
let g:pymode_breakpoint_key = 'e'    " Hot-key для установки брейкпойнта

"---------------=== Группировка кода (class, def и т. п.) ===-------------

set foldmethod=syntax
set foldnestmax=10
set foldlevel=99
set nofoldenable

" Горячая клавиша 'Пробел'
nnoremap  za

"---------------=== Разделение экрана ===-------------

" :vs /way/to/file вертикальное разделение
" :sp /way/to/file горизонтальное разделение

set splitright                              " разделять по вертикали справа
set splitbelow				                " разделять по горизонтали снизу

" навигация по разделенному экрану
nnoremap   
nnoremap  
nnoremap  
nnoremap  

"---------------=== Вкладки ===-------------

" Следующая вкладка / Предыдущая вкладка
map  gt
map  gT

"---------------=== ctrlp Поиск, открытие файлов ===-------------

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

"---------------=== Настройка NerdTree ===-------------

let NERDTreeIgnore=['\.pyc$', '\~$'] 	            " игнорировать типы файлов
let g:NERDTreeDirArrowExpandable = '›' 	            " свои указатели
let g:NERDTreeDirArrowCollapsible = '–'             " свои указатели

" Горячая клавиша вкл/выкл 'Ctr + n'

map  :NERDTreeToggle
