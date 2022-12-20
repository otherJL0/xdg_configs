local wezterm = require 'wezterm'
local color_scheme = wezterm.color.get_builtin_schemes()['Catppuccin Mocha']
print(color_scheme)

return {
  font = wezterm.font 'JetBrains Mono',
	color_scheme = 'Catppuccin Mocha',
  enable_tab_bar = false,
  term = "wezterm",
}
