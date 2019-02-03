function! InsertSmartTab()
	if (col('.') > 1 && strgetchar(getline('.'), col('.') - 2) != 9)
		let tmp=((virtcol('.') - 1) % &sts)
		return strpart("                ", 0, &sts - tmp)
	else
		return "\<Tab>"
	endif
endfunction
inoremap <expr> <Tab> InsertSmartTab()

