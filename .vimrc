set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set nocompatible
set showmatch
set number
set tw=80
set omnifunc=syntaxcomplete#Complete
syntax on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab 
set autoindent
set list
colo ron

if has("autocmd")
    filetype plugin on
    filetype plugin indent on
endif

" shortcut \l for showing invisible symbols (tab, eof, ..) and customization
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

