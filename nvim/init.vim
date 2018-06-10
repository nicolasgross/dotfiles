if &compatible
	set nocompatible
endif

if has('nvim')
	set runtimepath+=/home/nicolas/.config/nvim/dein/repos/github.com/
		\Shougo/dein.vim
	if dein#load_state('/home/nicolas/.config/nvim/dein')
		call dein#begin('/home/nicolas/.config/nvim/dein')

		call dein#add('/home/nicolas/.config/nvim/dein/repos/github.com/Shougo/
			\dein.vim')

		call dein#add('Shougo/deoplete.nvim',
			\{'on_i': 1})
		call dein#add('zchee/deoplete-clang',
			\{'on_ft': ['c', 'cpp']})
		call dein#add('Shougo/neoinclude.vim',
			\{'on_ft': ['c', 'cpp']})
		call dein#add('eagletmt/neco-ghc',
			\{'on_ft': 'haskell'})
		call dein#add('neomake/neomake')
		call dein#add('itchyny/lightline.vim')
		call dein#add('bling/vim-bufferline')
		call dein#add('morhetz/gruvbox')
		call dein#add('lifepillar/vim-solarized8')
		call dein#add('scrooloose/nerdtree',
			\{'on_cmd': 'NERDTreeToggle'})
		call dein#add('hecal3/vim-leader-guide')
		call dein#add('junegunn/fzf.vim')
		call dein#add('milkypostman/vim-togglelist')
		call dein#add('vimwiki/vimwiki')
		call dein#add('justinmk/vim-syntax-extra')
		call dein#add('jreybert/vimagit')
		call dein#add('lervag/vimtex',
			\{'on_ft': 'tex'})
		call dein#add('moll/vim-bbye')
		call dein#add('dag/vim-fish')

		call dein#end()
		call dein#save_state()
	endif
endif

set termencoding=utf-8 encoding=utf-8 fileencoding=utf-8
set showmatch
set noet tabstop=4 softtabstop=4 shiftwidth=4
set mouse=r
set number
set omnifunc=syntaxcomplete#Complete
set autoindent
set list
set incsearch ignorecase smartcase
set completeopt=noselect,menuone,preview
set clipboard=unnamedplus
set textwidth=80
set colorcolumn=81
highlight ColorColumn ctermbg=darkgrey
filetype plugin indent on
syntax enable

au FileType haskell setl et
au FileType cabal setl et
au FileType yaml setl et
let g:tex_flavor="latex"

"disable ex mode
nnoremap Q <Nop>

"completion popup mappings
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"

"minimal smart tabs functionality
function! InsertSmartTab()
	if (col('.') > 1 && strgetchar(getline('.'), col('.') - 2) != 9)
		let tmp=((virtcol('.') - 1) % &sts)
		return strpart("                ", 0, &sts - tmp)
	else
		return "\<Tab>"
	endif
endfunction
inoremap <expr> <Tab> InsertSmartTab()

if !has('nvim')
	colorscheme industry
	set listchars=tab:>\ ,trail:-
else
	"colorscheme
	set termguicolors
	colorscheme gruvbox
	set background=dark

	"cursor
	set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,
		\i-ci:ver25-Cursor/lCursor-blinkon1,r-cr:hor20-Cursor/lCursor,
		\o:hor20-Cursor/block-Cursor
	au VimLeave * set guicursor=a:block-Cursor/lCursor-blinkon1

	"fzf
	let g:fzf_layout={ 'down': '~30%' }
	let $FZF_DEFAULT_COMMAND='rg --hidden --files --glob !.git'
	command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number
		\ --no-heading --color=always '.shellescape(<q-args>), 1,
		\ <bang>0 ? fzf#vim#with_preview('up:60%') :
		\ fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

	"deoplete
	let g:deoplete#enable_at_startup=1
	autocmd InsertLeave * if pumvisible() == 0 | pclose | endif

	"deoplete-clang
	let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
	let g:deoplete#sources#clang#clang_header='/usr/lib/clang'

	"neco-ghc
	let g:haskellmode_completion_ghc=0
	autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
	let g:necoghc_enable_detailed_browse=1

	"neomake
	call neomake#configure#automake('rw', 0)

	"lightline
	let g:lightline = {
		\ 'colorscheme': 'powerline',
		\ 'tabline': {
		\   'left': [ ['bufferline'] ]
		\ },
		\ 'component_expand': {
		\   'bufferline': 'LightlineBufferline',
		\ },
		\ 'component_type': {
		\   'bufferline': 'tabsel',
		\ },
		\ }
	function! LightlineBufferline()
		call bufferline#refresh_status()
		return [ g:bufferline_status_info.before,
			\ g:bufferline_status_info.current, g:bufferline_status_info.after]
	endfunction
	set showtabline=2

	"listtoggle
	let g:toggle_list_no_mappings=1

	"vimwiki
	let g:vimwiki_list=[{'path': '~/nextcloud/documents/vimwiki/',
		\ 'syntax': 'markdown', 'ext': '.md'}]
	let g:vimwiki_map_prefix='<Leader>v'

	"vimagit
	let g:magit_show_magit_mapping=''
	let g:magit_commit_mapping="C"

	"vim-leader-guide
	set timeoutlen=0
	set ttimeoutlen=0
	let mapleader="\<Space>"
	call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
	nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
	vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
	function! s:my_displayfunc()
		let g:leaderGuide#displayname=
		\substitute(g:leaderGuide#displayname, '\c<cr>$', '', '')
		let g:leaderGuide#displayname=
		\substitute(g:leaderGuide#displayname, '^<Plug>', '', '')
	endfunction
	let g:leaderGuide_displayfunc=[function("s:my_displayfunc")]
	let g:lmap={}
	let g:lmap.a={'name': '+Applications',
		\'t': ['terminal', 'terminal'],
		\}
	let g:lmap.b={'name': '+Buffers',
		\'b': ['Buffers', 'buffers'],
		\'c': ['Bdelete', 'close-buffer'],
		\'C': ['Bdelete!', 'ace-kill-buffer'],
		\'e': ['ggdG', 'erase-buffer'],
		\'m': ['bufdo bd', 'kill-other-buffers'],
		\'n': ['bn', 'next-buffer'],
		\'N': ['enew', 'new-empty-buffer'],
		\'p': ['bp', 'previous-buffer'],
		\'Y': ['%y', 'copy-whole-buffer-to-clipboard'],
		\}
	let g:lmap.f={'name': '+Files',
		\'f': ['Files .', 'find-file'],
		\'F': ['Files ~', 'global-find-file'],
		\'s': ['w', 'save-file'],
		\'S': ['bufdo w', 'save-all-files'],
		\}
	let g:lmap.f.i={'name': '+Init.vim',
		\'e': ['e $MYVIMRC', 'edit'],
		\'r': ['so $MYVIMRC', 'reload'],
		\}
	let g:lmap.g={'name': '+Git',
		\'f': ['GFiles', 'find-file'],
		\'s': ['Magit', 'stage'],
		\}
	let g:lmap.q={'name': '+Quit',
		\'q': ['qa', 'prompt-kill-vim'],
		\'Q': ['qa!', 'kill-vim'],
		\}
	let g:lmap.s={'name': '+Search',
		\'c': ['Commands', 'search-in-commands'],
		\'g': ['Rg', 'grep'],
		\'h': ['History:', 'search-in-cmd-history'],
		\'s': ['BLines', 'search-in-buffer'],
		\'S': ['Lines', 'search-in-all-buffers'],
		\}
	let g:lmap.t={'name': '+Toggles',
		\'b': ['let &background=(&background == "dark"? "light" : "dark")',
			\'background'],
		\'c': ['Colors', 'colorscheme'],
		\'e': ['NeomakeToggleBuffer', 'error-checking'],
		\'h': ['set hlsearch!', 'search-highlighting'],
		\'l': ['set cursorline!', 'cursorline'],
		\'n': ['set number!', 'line-numbers'],
		\'r': ['set relativenumber!', 'relative-line-numbers'],
		\'s': ['set spell!', 'spellchecking'],
		\'t': ['NERDTreeToggle', 'file-tree'],
		\}
	let g:lmap.t.w={'name': '+Windows',
		\'l': [':call ToggleLocationList()', 'location-list'],
		\'q': [':call ToggleQuickfixList()', 'quickfix-list'],
		\}
	let g:lmap.v={'name': '+Vimwiki'}
	let g:lmap.w={'name': '+Windows',
		\'=': ['wincmd =', 'balance-windows'],
		\'c': ['q', 'close-window'],
		\'C': ['q!', 'ace-kill-window'],
		\'d': ['resize -5', 'decrease-window-hor'],
		\'D': ['vertical resize -10', 'decrease-window-vert'],
		\'h': ['wincmd h', 'focus-window-left'],
		\'H': ['wincmd H', 'move-window-left'],
		\'i': ['resize +5', 'increase-window-hor'],
		\'I': ['vertical resize +10', 'increase-window-vert'],
		\'j': ['wincmd j', 'focus-window-down'],
		\'J': ['wincmd J', 'move-window-down'],
		\'k': ['wincmd k', 'focus-window-up'],
		\'K': ['wincmd K', 'move-window-up'],
		\'l': ['wincmd l', 'focus-window-right'],
		\'L': ['wincmd L', 'move-window-right'],
		\'o': ['only', 'close-other-windows'],
		\'s': ['split', 'split-window-below'],
		\'S': ['split\|wincmd w', 'split-window-below-and-focus'],
		\'v': ['vsplit', 'split-window-right'],
		\'V': ['vsplit\|wincmd w', 'split-window-right-and-focus'],
		\}
endif

