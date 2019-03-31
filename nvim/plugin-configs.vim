if has('nvim')
	"fzf
	set runtimepath+=/home/nicolas/.config/nvim/dein/repos/github.com/junegunn
		\/fzf
	let g:fzf_layout={ 'down': '~30%' }
	let $FZF_DEFAULT_COMMAND='rg --hidden --files --glob !.git'
	command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number
		\ --no-heading --color=always '.shellescape(<q-args>), 1,
		\ <bang>0 ? fzf#vim#with_preview('up:60%') :
		\ fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

	"ale
	let g:ale_linters_explicit=1
	let g:ale_lint_on_text_changed=0
	let g:ale_lint_on_enter=1
	let g:ale_lint_on_save=1
	let g:ale_linters={'tex': ['chktex']
		\ }
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
		\ 'component_function': {
		\   'cocstatus': 'coc#status'
		\ },
		\ 'active': {
		\   'right': [[ 'lineinfo' ], [ 'percent' ], [ 'cocstatus',
		\            'fileformat', 'fileencoding', 'filetype' ],
		\            [ 'linter_errors', 'linter_warnings',
		\            'linter_checking' ]],
		\   'left': [[ 'mode', 'paste' ], [ 'readonly', 'filename',
		\           'modified' ]],
		\ },
		\ }
	function! LightlineBufferline()
		call bufferline#refresh_status()
		return [ g:bufferline_status_info.before,
			\ g:bufferline_status_info.current, g:bufferline_status_info.after]
	endfunction

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
	let g:lmap={
		\'m': 'messages',
		\'u': 'update plugins',
		\}
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
		\'a': 'auto-line-breaks',
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
