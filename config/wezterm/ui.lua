local wezterm = require("wezterm")
local catppuccin = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
local module = {}

function module.apply_to_config(config)
	config.color_scheme = "Catppuccin Mocha"
	config.command_palette_bg_color = catppuccin.selection_bg
	config.command_palette_fg_color = catppuccin.selection_fg
	--
	-- The filled in variant of the < symbol
	local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

	-- The filled in variant of the > symbol
	local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

	wezterm.on("update-status", function(window, pane)
		local name = window:active_key_table()
		local element = {}

		if name then
			name = "TABLE: " .. name
			element = {
				{ Foreground = { AnsiColor = "Black" } },
				{ Background = { AnsiColor = "Purple" } },
				{ Text = name },
			}
		end
		window:set_left_status(wezterm.format(element))
	end)

	wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
		local edge_background = catppuccin.tab_bar.background
		local background = catppuccin.tab_bar.inactive_tab.bg_color
		local foreground = catppuccin.tab_bar.inactive_tab.fg_color

		if tab.is_active then
			background = catppuccin.tab_bar.active_tab.bg_color
			foreground = catppuccin.tab_bar.active_tab.fg_color
		elseif hover then
			background = catppuccin.tab_bar.inactive_tab_hover.bg_color
			foreground = catppuccin.tab_bar.inactive_tab_hover.fg_color
		end

		local title = wezterm.truncate_right(tab.active_pane.title, max_width - 2)

		return {
			{ Background = { Color = edge_background } },
			{ Foreground = { Color = background } },
			{ Text = SOLID_LEFT_ARROW },
			{ Background = { Color = background } },
			{ Foreground = { Color = foreground } },
			{ Text = title },
			{ Background = { Color = edge_background } },
			{ Foreground = { Color = background } },
			{ Text = SOLID_RIGHT_ARROW },
		}
	end)
end

return module
