if &compatible
	set nocompatible
endif

set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set showmatch
set et
set tabstop=4
set softtabstop=4
set shiftwidth=4
set mouse-=a
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
set lazyredraw
set scrolloff=5
set conceallevel=2

filetype plugin indent on
syntax enable
let g:tex_flavor="latex"

" restore terminal cursor on leave
"au VimLeave * set guicursor=a:ver25-Cursor/lCursor-blinkon1

if has('termguicolors')
	set termguicolors
endif

colorscheme slate
highlight ColorColumn guibg=Black
set laststatus=2
set omnifunc=syntaxcomplete#Complete

hi! clear Conceal

" -- disable ex mode
nnoremap Q <Nop>

" -- completion popup
"inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
"inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
"inoremap <expr> <C-l> pumvisible() ? "\<C-y>" : "\<C-l>"
