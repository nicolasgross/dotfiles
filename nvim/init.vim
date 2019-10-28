if &compatible
	set nocompatible
endif

source ~/.config/nvim/plugin-manager.vim

set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set showmatch
set noet
set tabstop=4
set softtabstop=4
set shiftwidth=4
set mouse=r
set autoread
set number
set spelllang=de_de,en_us
set autoindent
set hidden
set list
set listchars=tab:>.,trail:-,nbsp:+
set incsearch
set ignorecase
set smartcase
set completeopt=noselect,noinsert,menuone,preview
set clipboard=unnamedplus
set textwidth=79
set colorcolumn=80
set showtabline=2
set lazyredraw
set scrolloff=5

" restore terminal cursor on leave
au VimLeave * set guicursor=a:ver25-Cursor/lCursor-blinkon1

"for autoread in terminal mode
if !has('gui_running')
	let timer=timer_start(3000, 'AutoreadFunc', {'repeat': -1})
	func! AutoreadFunc(timer)
		:checktime
	endfunc
endif

if has('termguicolors')
	set termguicolors
endif

filetype plugin indent on
syntax enable
let g:tex_flavor="latex"

"disable ex mode
nnoremap Q <Nop>

if has('nvim')
	set timeoutlen=500
	colorscheme nord
else
	set timeoutlen=2000
	colorscheme slate
	highlight ColorColumn guibg=Black
	set laststatus=2
endif

source ~/.config/nvim/smarttabs.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugin-configs.vim

