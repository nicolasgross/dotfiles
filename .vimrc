set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Put your non-Plugin stuff after this line

set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set showmatch
set number
set omnifunc=syntaxcomplete#Complete
syntax on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set autoindent
set list
set t_ut=
set t_Co=256
let g:filetype_pl="prolog"
set colorcolumn=81
highlight ColorColumn ctermbg=darkgrey
colorscheme gruvbox

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if has("autocmd")
    filetype plugin on
    filetype plugin indent on
endif

" shortcut \l for showing invisible symbols (tab, eof, ..) and customization
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

