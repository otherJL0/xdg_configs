" vimscript
func! NvimGps() abort
	return luaeval("require'nvim-gps'.is_available()") ?
		\ luaeval("require'nvim-gps'.get_location()") : ''
endf

set winbar+=%{NvimGps()}
