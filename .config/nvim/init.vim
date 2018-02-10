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
	call dein#add('dpc/vim-smarttabs')
	call dein#add('itchyny/lightline.vim')
	call dein#add('bling/vim-bufferline')
	call dein#add('morhetz/gruvbox')
	call dein#add('lifepillar/vim-solarized8')
	call dein#add('scrooloose/nerdtree',
		\{'on_cmd': 'NERDTreeToggle'})
	call dein#add('hecal3/vim-leader-guide')
	call dein#add('junegunn/fzf.vim')
	call dein#add('Valloric/ListToggle')
	call dein#add('vimwiki/vimwiki')
	call dein#add('justinmk/vim-syntax-extra')
	call dein#add('jreybert/vimagit')

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable
set termencoding=utf-8 encoding=utf-8 fileencoding=utf-8
set showmatch
set mouse=a
set number
set omnifunc=syntaxcomplete#Complete
set autoindent
set list
set cursorline
set incsearch ignorecase smartcase
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
set rtp+=/usr/share/vim/vimfiles
let g:fzf_layout = { 'down': '~20%' }
let $FZF_DEFAULT_COMMAND = 'rg --hidden --files --glob !.git'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

"deoplete
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
set completeopt=noselect,noinsert,menuone,preview
imap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"
imap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
imap <expr><Up> pumvisible() ? "\<C-p>" : "\<Up>"
imap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
imap <silent><Esc><C-r> pumvisible() ? "\<C-y>" : "\<Esc>"<CR>

"deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

"neco-ghc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1

"neomake
call neomake#configure#automake('rw', 0)

"colorscheme
colorscheme gruvbox
set background=dark

"smart tabs
set noet tabstop=4 softtabstop=0 shiftwidth=4
set cindent
set cinoptions=(0,u0,U0

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
	return [ g:bufferline_status_info.before, g:bufferline_status_info.current, g:bufferline_status_info.after]
endfunction
set showtabline=2

"listtoggle
let g:lt_location_list_toggle_map = '<leader>tl'
let g:lt_quickfix_list_toggle_map = '<leader>tq'

"vimwiki
let g:vimwiki_list = [{'path': '~/nextcloud/documents/vimwiki/',
	\ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_map_prefix = '<Leader>v'

"vimagit
let g:magit_show_magit_mapping = '<leader>gc'
autocmd User VimagitBufferInit call magit#commit_command("CC")

"vim-leader-guide
set timeoutlen=0
set ttimeoutlen=0
nnoremap <c-w> <Space> 
let mapleader="\<Space>"
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
function! s:my_displayfunc()
	let g:leaderGuide#displayname =
	\ substitute(g:leaderGuide#displayname, '\c<cr>$', '', '')
	let g:leaderGuide#displayname = 
	\ substitute(g:leaderGuide#displayname, '^<Plug>', '', '')
endfunction
let g:leaderGuide_displayfunc = [function("s:my_displayfunc")]
let g:lmap={}
let g:lmap.a={'name': '+applications',
	\'t': ['terminal', 'terminal'],
	\}
let g:lmap.b={'name': '+buffers',
	\'b': ['Buffers', 'buffers'],
	\'d': ['bd', 'kill-buffer'],
	\'D': ['bd!', 'ace-kill-buffer'],
	\'e': ['ggdG', 'erase-buffer'],
	\'m': ['bufdo bd', 'kill-other-buffers'],
	\'n': ['bn', 'next-buffer'],
	\'N': ['enew', 'new-empty-buffer'],
	\'p': ['bp', 'previous-buffer'],
	\'Y': ['%y', 'copy-whole-buffer-to-clipboard'],
	\}
let g:lmap.f={'name': '+files',
	\'r': ['saveas', 'rename-file'],
	\'s': ['w', 'save-file'],
	\'S': ['bufdo w', 'save-all-files'],
	\'t': ['NERDTreeToggle', 'toggle-file-tree'],
	\}
let g:lmap.f.i={'name': '+init.vim',
	\'e': ['e $MYVIMRC', 'edit'],
	\'r': ['so $MYVIMRC', 'reload'],
	\}
let g:lmap.g={'name': '+git',
	\'c': ['Magit', 'commit'],
	\}
let g:lmap.q={'name': '+quit',
	\'q': ['qa', 'prompt-kill-vim'],
	\'Q': ['qa!', 'kill-vim'],
	\}
let g:lmap.s={'name': '+search',
	\'c': ['Commands', 'commands'],
	\'f': ['Files ~', 'counsel-find-file'],
	\'g': ['Rg', 'grep'],
	\'h': ['History:', 'command-history'],
	\'s': ['Lines', 'search-in-file'],
	\}
let g:lmap.t={'name': '+toggles',
	\'c': ['setlocal cursorline!', 'cursorline'],
	\'e': ['NeomakeToggleBuffer', 'error-checking'],
	\'h': ['set hlsearch!', 'search-highlighting'],
	\'l': ['LToggle', 'location-list'],
	\'n': ['setlocal number!', 'line-numbers'],
	\'q': ['QToggle', 'quickfix-list'],
	\'r': ['setlocal relativenumber!', 'relative-line-numbers'],
	\}
let g:lmap.v={'name': '+vimwiki'}
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

