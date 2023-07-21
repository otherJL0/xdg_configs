local wezterm = require("wezterm")
local config = {}
for _, module in ipairs({ "keymaps", "ui" }) do
	require(module).apply_to_config(config)
end

config.font = wezterm.font("JetBrains Mono")
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.term = "wezterm"
config.underline_position = -2.5
config.underline_thickness = 1
config.adjust_window_size_when_changing_font_size = false
config.font_size = 12.0
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.window_close_confirmation = "NeverPrompt"

return config
