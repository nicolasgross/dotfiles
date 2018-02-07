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
	call dein#add('Shougo/neoinclude.vim',
		\{'on_ft': ['c', 'cpp']})
	call dein#add('eagletmt/neco-ghc',
		\{'on_ft': 'haskell'})
	call dein#add('neomake/neomake')
	call dein#add('vim-scripts/Smart-Tabs')
	call dein#add('vim-airline/vim-airline')
	call dein#add('morhetz/gruvbox')
	call dein#add('scrooloose/nerdtree',
		\{'on_cmd': 'NERDTreeToggle'})
	call dein#add('hecal3/vim-leader-guide')

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
set autoindent
set list
set termguicolors
set colorcolumn=81
highlight ColorColumn ctermbg=darkgrey
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor-blinkon1,r-cr:hor20-Cursor/lCursor,o:hor20-Cursor/block-Cursor
au VimLeave * set guicursor=a:block-Cursor/lCursor-blinkon0
set clipboard+=unnamedplus
au FileType haskell setl et tabstop=2 softtabstop=2 shiftwidth=2
au FileType cabal setl et
au FileType yaml setl et tabstop=2 softtabstop=2 shiftwidth=2

"fzf
set rtp+=~/.fzf
let g:fzf_layout = { 'down': '~20%' }
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

"deoplete
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
"let g:deoplete#sources#clang#clang_complete_database = 'bin/'

"neco-ghc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1

"neomake
call neomake#configure#automake('rw', 0)
let g:neomake_open_list = 2

"gruvbox
colorscheme gruvbox
set background=dark

"ctrlp
let g:ctrlp_show_hidden = 1

"smart tabs
set noet tabstop=4 softtabstop=0 shiftwidth=4
set cindent
set cinoptions=(0,u0,U0

"airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1

"vim-leader-guide
nnoremap <c-w> <Space> 
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
	\'f': ['FZF ~', 'counsel-find-file'],
	\'t': ['NERDTreeToggle', 'toggle-file-tree'],
	\'s': ['w', 'save-buffer'],
	\'S': ['bufdo w', 'save-all-buffers'],
	\}
let g:lmap.q={'name': '+quit',
	\'q': ['qa', 'prompt-kill-vim'],
	\'Q': ['qa!', 'kill-vim'],
	\}
let g:lmap.t={'name': '+toggles',
	\'l': ['NeomakeToggleBuffer', 'linting'],
	\'n': ['setlocal number!', 'line-numbers'],
	\'r': ['setlocal relativenumber!', 'relative-line-numbers'],
	\}
let g:lmap.w={'name': '+windows',
	\'=': ['wincmd =', 'balance-windows'],
	\'c': ['q', 'delete-window'],
	\'C': ['q!', 'ace-delete-window'],
	\'h': ['wincmd h', 'focus-window-left'],
	\'H': ['wincmd H', 'move-window-left'],
	\'j': ['wincmd j', 'focus-window-down'],
	\'J': ['wincmd J', 'move-window-down'],
	\'k': ['wincmd k', 'focus-window-up'],
	\'K': ['wincmd K', 'move-window-up'],
	\'l': ['wincmd l', 'focus-window-right'],
	\'L': ['wincmd L', 'move-window-right'],
	\'p': ['wincmd p', 'focus-previous-window'],
	\'s': ['split', 'split-window-below'],
	\'S': ['split\|wincmd w', 'split-window-below-and-focus'],
	\'v': ['vsplit', 'split-window-right'],
	\'V': ['vsplit\|wincmd w', 'split-window-right-and-focus'],
	\'w': ['wincmd w', 'next-window'],
	\}

