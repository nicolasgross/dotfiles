if &compatible
	set nocompatible
endif

filetype plugin indent on
syntax enable
set termencoding=utf-8 encoding=utf-8 fileencoding=utf-8
set showmatch
set mouse=a
set number
set omnifunc=syntaxcomplete#Complete
set noet tabstop=4 softtabstop=4 shiftwidth=4
set autoindent
set list
set cursorline
set incsearch ignorecase smartcase
colorscheme industry
set colorcolumn=81
highlight ColorColumn ctermbg=darkgrey
set clipboard+=unnamedplus

au FileType haskell setl et tabstop=2 softtabstop=2 shiftwidth=2
au FileType cabal setl et
au FileType yaml setl et tabstop=2 softtabstop=2 shiftwidth=2
