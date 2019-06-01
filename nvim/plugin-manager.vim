if has('nvim')
	call plug#begin('~/.local/share/nvim/plugged')

	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
	Plug 'lervag/vimtex', {'for': 'tex'}
	Plug 'w0rp/ale'
	Plug 'maximbaz/lightline-ale'
	Plug 'honza/vim-snippets'
	Plug 'justinmk/vim-syntax-extra'
	Plug 'vimwiki/vimwiki'
	Plug 'itchyny/lightline.vim'
	Plug 'bling/vim-bufferline'
	Plug 'morhetz/gruvbox'
	Plug 'lifepillar/vim-solarized8'
	Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
	Plug 'liuchengxu/vim-which-key'
	Plug 'junegunn/fzf.vim'
	Plug 'milkypostman/vim-togglelist'
	Plug 'jreybert/vimagit', {'on': 'Magit'}
	Plug 'moll/vim-bbye'
	Plug 'editorconfig/editorconfig-vim'

	call plug#end()
endif

