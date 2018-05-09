# custom fish keybindings
function fish_user_key_bindings
	# use CTRL-j and CTRL-k in insert mode for up and down
	bind -M insert \cj down-or-search
	bind -M insert \ck up-or-search
	
	# use CTRL-f to accept suggestion and enter
	bind \cf 'commandline -f accept-autosuggestion'
	bind -M insert \cf 'commandline -f accept-autosuggestion'

	# use CTRL-g to accept suggestion and enter
	bind \cg 'commandline -f forward-word'
	bind -M insert \cg 'commandline -f forward-word'
end

