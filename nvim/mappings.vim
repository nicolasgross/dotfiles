"plugin independent:

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


"plugin dependent:

if has('nvim')
	" -- buffers
	nnoremap <leader>bb :Buffers<CR>
	nnoremap <leader>bc :Bdelete<CR>
	nnoremap <leader>bC :Bdelete!<CR>
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
	nnoremap <leader>twl :call ToggleLocationList()<CR>
	nnoremap <leader>twq :call ToggleQuickfixList()<CR>
endif

