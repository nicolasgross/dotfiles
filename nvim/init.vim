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

		call dein#add('Shougo/deoplete.nvim')
		call dein#add('Shougo/neco-syntax')
		call dein#add('Shougo/deoplete-clangx',
			\{'on_ft': ['c', 'cpp']})
		call dein#add('Shougo/neoinclude.vim',
			\{'on_ft': ['c', 'cpp']})
		call dein#add('justinmk/vim-syntax-extra')
		call dein#add('eagletmt/neco-ghc',
			\{'on_ft': 'haskell'})
		call dein#add('rust-lang/rust.vim',
			\{'on_ft': 'rust'})
		call dein#add('lervag/vimtex',
			\{'on_ft': 'tex'})
		call dein#add('dag/vim-fish')
		call dein#add('w0rp/ale')
		call dein#add('vimwiki/vimwiki')
		call dein#add('itchyny/lightline.vim')
		call dein#add('maximbaz/lightline-ale')
		call dein#add('bling/vim-bufferline')
		call dein#add('morhetz/gruvbox')
		call dein#add('lifepillar/vim-solarized8')
		call dein#add('scrooloose/nerdtree',
			\{'on_cmd': 'NERDTreeToggle'})
		call dein#add('liuchengxu/vim-which-key')
		call dein#add('junegunn/fzf', {'merged': 0})
		call dein#add('junegunn/fzf.vim')
		call dein#add('milkypostman/vim-togglelist')
		call dein#add('jreybert/vimagit',
			\{'on_cmd': 'Magit'})
		call dein#add('moll/vim-bbye')
		call dein#add('editorconfig/editorconfig-vim')

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
set listchars=tab:>.,trail:-,nbsp:+
set incsearch ignorecase smartcase
set completeopt=noselect,menuone,preview
set clipboard=unnamedplus
set textwidth=79
set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey
filetype plugin indent on
syntax enable
let g:tex_flavor="latex"

"mappings - plugin independent
let mapleader="\<Space>"
" -- applications
nnoremap <leader>at :terminal<CR>
" -- init.vim
nnoremap <leader>fie :edit $MYVIMRC<CR>
nnoremap <leader>fir :source $MYVIMRC<CR>
" -- buffers
nnoremap <leader>bc :bdelete<CR>
nnoremap <leader>bC :bdelete!<CR>
nnoremap <leader>be :ggdG<CR>
nnoremap <leader>bm :bufdo bd<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bN :enew<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bY :%y<CR>
" -- files
nnoremap <leader>fs :w<CR>
nnoremap <leader>fS :bufdo w<CR>
" -- quit
nnoremap <leader>qq :qa<CR>
nnoremap <leader>qQ :qa!<CR>
" -- toggles
nnoremap <leader>tb :let &background=(&background == "dark"? "light" :
	\ "dark")<CR>
nnoremap <leader>th :set hlsearch!<CR>
nnoremap <leader>tl :set cursorline!<CR>
nnoremap <leader>tn :set number!<CR>
nnoremap <leader>tr :set relativenumber!<CR>
nnoremap <leader>ts :set spell!<CR>
" -- windows
nnoremap <leader>w= :wincmd =<CR>
nnoremap <leader>wc :q<CR>
nnoremap <leader>wC :q!<CR>
nnoremap <leader>wd :resize -5<CR>
nnoremap <leader>wD :vertical resize -10<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wH :wincmd H<CR>
nnoremap <leader>wi :resize +5<CR>
nnoremap <leader>wI :vertical resize +10<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wJ :wincmd J<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wK :wincmd K<CR>
nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wL :wincmd L<CR>
nnoremap <leader>wo :only<CR>
nnoremap <leader>ws :split<CR>
nnoremap <leader>wS :split\|wincmd w<CR>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wV :vsplit\|wincmd w<CR>
" -- completion popup
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"

"disable ex mode
nnoremap Q <Nop>

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
	set timeoutlen=2000
	colorscheme industry
	set listchars=tab:>\ ,trail:-
else
	"mappings - plugin dependent
	" -- buffers
	nnoremap <leader>bb :Buffers<CR>
	" -- files
	nnoremap <leader>ff :Files .<CR>
	nnoremap <leader>fF :Files ~<CR>
	" -- git
	nnoremap <leader>gf :GFiles<CR>
	nnoremap <leader>gs :Magit<CR>
	" -- search
	nnoremap <leader>sc :Commands<CR>
	nnoremap <leader>sg :Rg<CR>
	nnoremap <leader>sh :History<CR>
	nnoremap <leader>ss :BLines<CR>
	nnoremap <leader>sS :Lines<CR>
	" -- toggles
	nnoremap <leader>tc :Colors<CR>
	nnoremap <leader>te :ALEToggle<CR>
	nnoremap <leader>tt :NERDTreeToggle<CR>
	nnoremap <leader>twl :ToggleLocationList<CR>
	nnoremap <leader>twq :ToggleQuickfixList<CR>

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
	set runtimepath+=/home/nicolas/.config/nvim/dein/repos/github.com/junegunn
		\/fzf
	let g:fzf_layout={ 'down': '~30%' }
	let $FZF_DEFAULT_COMMAND='rg --hidden --files --glob !.git'
	command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number
		\ --no-heading --color=always '.shellescape(<q-args>), 1,
		\ <bang>0 ? fzf#vim#with_preview('up:60%') :
		\ fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

	"deoplete
	let g:deoplete#enable_at_startup=1
	autocmd InsertLeave * if pumvisible() == 0 | pclose | endif

	"deoplete-clangx
	call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')

	"ale
	let g:ale_lint_on_text_changed=0
	let g:ale_lint_on_enter=0
	let g:ale_lint_on_save=1
	let g:ale_linters={'c': ['gcc', 'clang-tidy', 'flawfinder']}
	let g:ale_c_parse_compile_commands=1

	"lightline
	let g:lightline = {
		\ 'colorscheme': 'powerline',
		\ 'tabline': {
		\   'left': [ ['bufferline'] ]
		\ },
		\ 'component_expand': {
		\   'bufferline': 'LightlineBufferline',
		\   'linter_checking': 'lightline#ale#checking',
		\   'linter_warnings': 'lightline#ale#warnings',
		\   'linter_errors': 'lightline#ale#errors',
		\ },
		\ 'component_type': {
		\   'bufferline': 'tabsel',
		\   'linter_checking': 'left',
		\   'linter_warnings': 'warning',
		\   'linter_errors': 'error',
		\ },
		\ 'active': {
		\   'right': [[ 'lineinfo' ], [ 'percent' ], [ 'fileformat',
		\            'fileencoding', 'filetype' ], [ 'linter_errors',
		\            'linter_warnings', 'linter_checking' ]],
		\   'left': [[ 'mode', 'paste' ], [ 'readonly', 'filename',
		\           'modified' ]],
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

	"vim-which-key
	set timeoutlen=500
	nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
	vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
	call which_key#register('<Space>', "g:lmap")
	autocmd! FileType which_key
	autocmd  FileType which_key set laststatus=0 noshowmode noruler
		\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
	let g:lmap={}
	let g:lmap.a={'name': '+Applications',
		\'t': 'terminal',
		\}
	let g:lmap.b={'name': '+Buffers',
		\'b': 'buffers',
		\'c': 'close-buffer',
		\'C': 'ace-kill-buffer',
		\'e': 'erase-buffer',
		\'m': 'kill-other-buffers',
		\'n': 'next-buffer',
		\'N': 'new-empty-buffer',
		\'p': 'previous-buffer',
		\'Y': 'copy-whole-buffer-to-clipboard',
		\}
	let g:lmap.f={'name': '+Files',
		\'f': 'find-file',
		\'F': 'global-find-file',
		\'s': 'save-file',
		\'S': 'save-all-files',
		\}
	let g:lmap.f.i={'name': '+Init.vim',
		\'e': 'edit',
		\'r': 'reload',
		\}
	let g:lmap.g={'name': '+Git',
		\'f': 'find-file',
		\'s': 'stage',
		\}
	let g:lmap.q={'name': '+Quit',
		\'q': 'prompt-kill-vim',
		\'Q': 'kill-vim',
		\}
	let g:lmap.s={'name': '+Search',
		\'c': 'search-in-commands',
		\'g': 'grep',
		\'h': 'search-in-cmd-history',
		\'s': 'search-in-buffer',
		\'S': 'search-in-all-buffers',
		\}
	let g:lmap.t={'name': '+Toggles',
		\'b': 'background',
		\'c': 'colorscheme',
		\'e': 'error-checking',
		\'h': 'search-highlighting',
		\'l': 'cursorline',
		\'n': 'line-numbers',
		\'r': 'relative-line-numbers',
		\'s': 'spellchecking',
		\'t': 'file-tree',
		\}
	let g:lmap.t.w={'name': '+Windows',
		\'l': 'location-list',
		\'q': 'quickfix-list',
		\}
	let g:lmap.v={'name': '+Vimwiki'}
	let g:lmap.w={'name': '+Windows',
		\'=': 'balance-windows',
		\'c': 'close-window',
		\'C': 'ace-kill-window',
		\'d': 'decrease-window-hor',
		\'D': 'decrease-window-vert',
		\'h': 'focus-window-left',
		\'H': 'move-window-left',
		\'i': 'increase-window-hor',
		\'I': 'increase-window-vert',
		\'j': 'focus-window-down',
		\'J': 'move-window-down',
		\'k': 'focus-window-up',
		\'K': 'move-window-up',
		\'l': 'focus-window-right',
		\'L': 'move-window-right',
		\'o': 'close-other-windows',
		\'s': 'split-window-below',
		\'S': 'split-window-below-and-focus',
		\'v': 'split-window-right',
		\'V': 'split-window-right-and-focus',
		\}
endif

