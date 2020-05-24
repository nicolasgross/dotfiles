if has('nvim')
	"fzf
	let g:fzf_layout={ 'down': '~30%' }
	let $FZF_DEFAULT_COMMAND='rg --hidden --files --glob !.git'
	command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number
		\ --no-heading --color=always '.shellescape(<q-args>), 1,
		\ <bang>0 ? fzf#vim#with_preview('up:60%') :
		\ fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

	"lightline
	let g:lightline = {
		\ 'colorscheme': 'nord',
		\ 'tabline': {
		\   'left': [ ['bufferline'] ]
		\ },
		\ 'component_expand': {
		\   'bufferline': 'LightlineBufferline',
		\ },
		\ 'component_type': {
		\   'bufferline': 'tabsel',
		\ },
		\ 'component_function': {
		\   'cocstatus': 'coc#status'
		\ },
		\ 'active': {
		\   'right': [[ 'lineinfo' ], [ 'percent' ], [ 'cocstatus',
		\            'fileformat', 'fileencoding', 'filetype' ]],
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
	let g:vimwiki_global_ext=0

	"vim-markdown
	let g:vim_markdown_folding_disabled=1

	"vimagit
	let g:magit_show_magit_mapping=''
	let g:magit_commit_mapping="C"

	"vim-which-key
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
	let g:lmap.c={'name': '+Coc',
		\'d': 'show documentation',
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
		\'d': 'decrease-window-vert',
		\'D': 'decrease-window-hor',
		\'h': 'focus-window-left',
		\'H': 'move-window-left',
		\'i': 'increase-window-vert',
		\'I': 'increase-window-hor',
		\'j': 'focus-window-down',
		\'J': 'move-window-down',
		\'k': 'focus-window-up',
		\'K': 'move-window-up',
		\'l': 'focus-window-right',
		\'L': 'move-window-right',
		\'o': 'close-other-windows',
		\'s': 'split-window-below-and-focus',
		\'S': 'split-window-below',
		\'v': 'split-window-right-and-focus',
		\'V': 'split-window-right',
		\}
endif

