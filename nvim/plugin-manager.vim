if has('nvim')
	call plug#begin('~/.local/share/nvim/plugged')

	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
	Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile'}
	Plug 'fannheyward/coc-texlab', {'do': 'yarn install --frozen-lockfile'}
	Plug 'ckipp01/coc-metals', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
	Plug 'honza/vim-snippets'
	Plug 'justinmk/vim-syntax-extra'
	Plug 'plasticboy/vim-markdown'
	Plug 'godlygeek/tabular'
	Plug 'vimwiki/vimwiki'
	Plug 'itchyny/lightline.vim'
	Plug 'bling/vim-bufferline'
	Plug 'morhetz/gruvbox'
	Plug 'arcticicestudio/nord-vim'
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

