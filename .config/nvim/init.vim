if &compatible
	set nocompatible
endif
set runtimepath+=/home/nicolas/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/nicolas/.config/nvim/dein')
	call dein#begin('/home/nicolas/.config/nvim/dein')

	call dein#add('/home/nicolas/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

	call dein#add('Shougo/deoplete.nvim',
		\{'on_i': 1})
	call dein#add('zchee/deoplete-clang',
		\{'on_ft': ['c', 'cpp']})
	call dein#add('eagletmt/neco-ghc',
		\{'on_ft': 'haskell'})
	call dein#add('suan/vim-instant-markdown',
		\{'on_ft': 'markdown'})
	call dein#add('lervag/vimtex',
		\{'on_ft': ['latex', 'tex']})
	call dein#add('vim-syntastic/syntastic')

	call dein#add('vim-airline/vim-airline')
	call dein#add('morhetz/gruvbox')
	call dein#add('scrooloose/nerdtree',
		\{'on_cmd': 'NERDTreeToggle'})
	call dein#add('ctrlpvim/ctrlp.vim',
		\{'on_cmd': 'CtrlP'})
	call dein#add('hecal3/vim-leader-guide')
	call dein#add('Raimondi/delimitMate',
		\{'on_i': 1})
	"call dein#add('vim-scripts/Smart-Tabs')

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set showmatch
set mouse=a
set number
set omnifunc=syntaxcomplete#Complete
set tabstop=4 softtabstop=4 shiftwidth=4
set cindent
set cinoptions=(0,u0,U0
set autoindent
set list
set termguicolors
set colorcolumn=81
highlight ColorColumn ctermbg=darkgrey
set guicursor=n-v-c:block-Cursor/lCursor-blinkon1,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,o:hor20-Cursor/block-Cursor
au VimLeave * set guicursor=a:ver25-Cursor/lCursor-blinkon0
tnoremap <Esc> <C-\><C-n>
set clipboard=unnamedplus
au FileType haskell setl et tabstop=2 softtabstop=2 shiftwidth=2
au FileType cabal setl et
au FileType yaml setl et tabstop=2 softtabstop=2 shiftwidth=2

"gruvbox
colorscheme gruvbox
set background=dark

"airline
let g:airline_powerline_fonts=1
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled=1

"deoplete
let g:deoplete#enable_at_startup=1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"deoplete-clang
let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/lib/clang'

"neco-ghc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_error_symbol="✗"
let g:syntastic_warning_symbol="⚠"

"vim-leader-guide
let mapleader="\<Space>"
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
let g:lmap={}
let g:lmap.a={'name': '+applications',
	\'t': ['terminal', 'terminal'],
	\}
let g:lmap.b={'name': '+buffers',
	\'b': ['CtrlPBuffer', 'buffers'],
	\'d': ['bd', 'kill-this-buffer'],
	\'D': ['bd!', 'ace-kill-this-buffer'],
	\'e': ['ggdG', 'safe-erase-buffer'],
	\'m': ['bufdo bd', 'kill-other-buffers'],
	\'n': ['bn', 'next-buffer'],
	\'N': ['enew', 'new-empty-buffer'],
	\'p': ['bp', 'previous-buffer'],
	\'Y': ['%y', 'copy-whole-buffer-to-clipboard'],
	\}
let g:lmap.f={'name': '+files',
	\'c': ['SyntasticCheck', 'check-for-errors'],
	\'f': ['CtrlP', 'counsel-find-file'],
	\'t': ['NERDTreeToggle', 'toggle-file-tree'],
	\'s': ['w', 'save-buffer'],
	\'S': ['bufdo w', 'save-all-buffers'],
	\}
let g:lmap.q={'name': '+quit',
	\'q': ['qa', 'prompt-kill-vim'],
	\'Q': ['qa!', 'kill-vim'],
	\}
let g:lmap.t={'name': '+toggles',
	\'e': ['SyntasticToggleMode', 'error-checking'],
	\'n': ['setlocal number!', 'line-numbers'],
	\'r': ['setlocal relativenumber!', 'relative-line-numbers'],
	\}
let g:lmap.w={'name': '+windows',
	\'=': ['wincmd =', 'balance-windows'],
	\'d': ['q', 'delete-window'],
	\'D': ['q!', 'ace-delete-window'],
	\'h': ['wincmd h', 'window-left'],
	\'H': ['wincmd H', 'window-far-left'],
	\'j': ['wincmd j', 'window-down'],
	\'J': ['wincmd J', 'window-very-bottom'],
	\'k': ['wincmd k', 'window-up'],
	\'K': ['wincmd K', 'window-very-top'],
	\'l': ['wincmd l', 'window-left'],
	\'L': ['wincmd L', 'window-far-left'],
	\'s': ['split', 'split-window-below'],
	\'S': ['split\|wincmd w', 'split-window-below-and-focus'],
	\'v': ['vsplit', 'split-window-right'],
	\'V': ['vsplit\|wincmd w', 'split-window-right-and-focus'],
	\'w': ['wincmd w', 'other-window'],
	\}

