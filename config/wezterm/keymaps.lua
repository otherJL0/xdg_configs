local wezterm = require("wezterm")
local act = wezterm.action
local callback = wezterm.action_callback

local module = {}

function module.apply_to_config(config)
	config.leader = { key = ":", mods = "CTRL|SHIFT" }

	config.keys = {
		{
			key = "!",
			-- mods = "LEADER | SHIFT",
			mods = "LEADER",
			action = callback(function(win, pane)
				local tab, window = pane:move_to_new_tab()
				tab:activate()
			end),
		},
		{
			key = "H",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "resize_pane",
				one_shot = false,
				until_unknown = true,
			}),
		},
		{
			key = "J",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "resize_pane",
				one_shot = false,
				until_unknown = true,
			}),
		},
		{
			key = "K",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "resize_pane",
				one_shot = false,
				until_unknown = true,
			}),
		},
		{
			key = "L",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "resize_pane",
				one_shot = false,
				until_unknown = true,
			}),
		},

		-- CTRL+SHIFT+Space, followed by 'a' will put us in activate-pane
		-- mode until we press some other key or until 1 second (1000ms)
		-- of time elapses
		{
			key = "a",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "activate_pane",
				timeout_milliseconds = 1000,
				one_shot = false,
				until_unknown = true,
			}),
		},
		{
			key = "Enter",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "split_pane",
				timeout_milliseconds = 1000,
			}),
		},
		{
			key = "%",
			mods = "LEADER",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = '"',
			mods = "LEADER",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "t",
			mods = "LEADER",
			action = act.SpawnTab("CurrentPaneDomain"),
		},

		{
			key = "c",
			mods = "LEADER",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "p",
			mods = "LEADER",
			action = act.ActivateTabRelativeNoWrap(-1),
		},
		{
			key = "n",
			mods = "LEADER",
			action = act.ActivateTabRelativeNoWrap(1),
		},
		{
			key = "{",
			mods = "LEADER",
			action = act.ActivateTabRelativeNoWrap(-1),
		},
		{
			key = "}",
			mods = "LEADER",
			action = act.ActivateTabRelativeNoWrap(1),
		},

		{
			key = "Z",
			mods = "LEADER",
			action = act.TogglePaneZoomState,
		},

		{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
		{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
		{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
		{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	}
	config.key_tables = {
		-- Defines the keys that are active in our resize-pane mode.
		-- Since we're likely to want to make multiple adjustments,
		-- we made the activation one_shot=false. We therefore need
		-- to define a key assignment for getting out of this mode.
		-- 'resize_pane' here corresponds to the name="resize_pane" in
		-- the key assignments above.
		resize_pane = {
			{ key = "H", action = act.AdjustPaneSize({ "Left", 1 }) },
			{ key = "L", action = act.AdjustPaneSize({ "Right", 1 }) },
			{ key = "K", action = act.AdjustPaneSize({ "Up", 1 }) },
			{ key = "J", action = act.AdjustPaneSize({ "Down", 1 }) },
			{ key = "Escape", action = "PopKeyTable" },
		},

		activate_pane = {
			{ key = "h", action = act.ActivatePaneDirection("Left") },
			{ key = "l", action = act.ActivatePaneDirection("Right") },
			{ key = "k", action = act.ActivatePaneDirection("Up") },
			{ key = "j", action = act.ActivatePaneDirection("Down") },
		},
	}
end

return module
