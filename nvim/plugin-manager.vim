if has('nvim')
	set runtimepath+=/home/nicolas/.config/nvim/dein/repos/github.com/
		\Shougo/dein.vim
	if dein#load_state('/home/nicolas/.config/nvim/dein')
		call dein#begin('/home/nicolas/.config/nvim/dein')

		call dein#add('/home/nicolas/.config/nvim/dein/repos/github.com/Shougo/
			\dein.vim')

		call dein#add('Shougo/deoplete.nvim')
		call dein#add('Shougo/neco-syntax')
		call dein#add('Shougo/deoplete-clangx',
			\{'on_ft': ['c', 'cpp']})
		call dein#add('Shougo/neoinclude.vim',
			\{'on_ft': ['c', 'cpp']})
		call dein#add('justinmk/vim-syntax-extra')
		call dein#add('eagletmt/neco-ghc',
			\{'on_ft': 'haskell'})
		call dein#add('rust-lang/rust.vim',
			\{'on_ft': 'rust'})
		call dein#add('lervag/vimtex',
			\{'on_ft': 'tex'})
		call dein#add('dag/vim-fish')
		call dein#add('w0rp/ale')
		call dein#add('vimwiki/vimwiki')
		call dein#add('itchyny/lightline.vim')
		call dein#add('maximbaz/lightline-ale')
		call dein#add('bling/vim-bufferline')
		call dein#add('morhetz/gruvbox')
		call dein#add('lifepillar/vim-solarized8')
		call dein#add('scrooloose/nerdtree',
			\{'on_cmd': 'NERDTreeToggle'})
		call dein#add('liuchengxu/vim-which-key')
		call dein#add('junegunn/fzf', {'merged': 0})
		call dein#add('junegunn/fzf.vim')
		call dein#add('milkypostman/vim-togglelist')
		call dein#add('jreybert/vimagit',
			\{'on_cmd': 'Magit'})
		call dein#add('moll/vim-bbye')
		call dein#add('editorconfig/editorconfig-vim')

		call dein#end()
		call dein#save_state()
	endif
endif

