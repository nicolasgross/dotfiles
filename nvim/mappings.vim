" -- SPACEMACS
let mapleader="\<Space>"
nnoremap <leader>m :messages<CR>
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
nnoremap <leader>ta :let &textwidth=(&textwidth == "79"? "0" :
	\ "79")<CR>
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
nnoremap <leader>wd :vertical resize -10<CR>
nnoremap <leader>wD :resize -5<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wH :wincmd H<CR>
nnoremap <leader>wi :vertical resize +10<CR>
nnoremap <leader>wI :resize +5<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wJ :wincmd J<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wK :wincmd K<CR>
nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wL :wincmd L<CR>
nnoremap <leader>wo :only<CR>
nnoremap <leader>ws :split\|wincmd w<CR>
nnoremap <leader>wS :split<CR>
nnoremap <leader>wv :vsplit\|wincmd w<CR>
nnoremap <leader>wV :vsplit<CR>

" -- disable ex mode
nnoremap Q <Nop>

" -- completion popup
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <C-l> pumvisible() ? "\<C-y>" : "\<C-l>"

" -- only mouse scrolling
:nmap <LeftMouse> <nop>
:imap <LeftMouse> <nop>
:vmap <LeftMouse> <nop>
:nmap <2-LeftMouse> <nop>
:imap <2-LeftMouse> <nop>
:vmap <2-LeftMouse> <nop>
:nmap <RightMouse> <nop>
:imap <RightMouse> <nop>
:vmap <RightMouse> <nop>


if has('nvim')
	function! s:show_documentation()
	  if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	  else
		call CocAction('doHover')
	  endif
	endfunction

	" -- SPACEMACS
	command! UpdateVimPlug PlugUpdate | PlugUpgrade
	nnoremap <leader>u :UpdateVimPlug<CR>
	" -- buffers
	nnoremap <leader>bb :Buffers<CR>
	nnoremap <leader>bc :Bdelete<CR>
	nnoremap <leader>bC :Bdelete!<CR>
	" -- coc
	nnoremap <leader>cd :call <SID>show_documentation()<CR>
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
	nnoremap <leader>tt :NERDTreeToggle<CR>
	nnoremap <leader>twl :call ToggleLocationList()<CR>
	nnoremap <leader>twq :call ToggleQuickfixList()<CR>

	" -- terminal
	au TermOpen * tnoremap <C-[><C-[> <C-\><C-n>
	au FileType fzf silent! tunmap <C-[><C-[>
else
	" -- terminal
	tnoremap <C-[><C-[> <C-\><C-n>
	" -- completion
	inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"

endif

