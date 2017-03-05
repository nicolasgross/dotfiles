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

Plugin 'jonathanfilip/vim-lucius'

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
colorscheme lucius
LuciusDarkLowContrast

if has("autocmd")
    filetype plugin on
    filetype plugin indent on
endif

" shortcut \l for showing invisible symbols (tab, eof, ..) and customization
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

