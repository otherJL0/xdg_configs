-- Table containing functions to resize current window
local tile_window = {
	-- Resize window to left 50% of screen
	left = function()
		local window = hs.window.focusedWindow()
		local screen = window:screen()
		local window_layout = window:frame():toUnitRect(screen:frame())

		-- If the window is already tiled to the left 50% of the screen
		-- and a monitor exists to the left of this widow,
		-- move window to the right half of the left monitor
		if window_layout:equals(hs.layout.left50) and screen:toWest() then
			window:moveOneScreenWest(false, true)
			window:move(hs.layout.right50)
		else
			window:move(hs.layout.left50)
		end
	end,

	-- Resize window to right 50% of screen
	right = function()
		local window = hs.window.focusedWindow()
		local screen = window:screen()
		local window_layout = window:frame():toUnitRect(screen:frame())

		-- If the window is already tiled to the right 50% of the screen
		-- and a monitor exists to the right of this widow,
		-- move window to the left half of the right monitor
		if window_layout:equals(hs.layout.right50) and screen:toEast() then
			window:moveOneScreenEast(false, true)
			window:move(hs.layout.left50)
		else
			window:move(hs.layout.right50)
		end
	end,

	-- Resize current window to half its height without changing its wiedth
	-- if the current window is taking up the left 50% of the screen,
	-- resizing with `top` changes current window to top left 25% of screen
	-- if the current window takes up the whole screen,
	-- resizing with `top` changes current window to top 50% of screen
	top = function()
		local window = hs.window.focusedWindow()
		local frame = window:frame()
		local screen = window:screen()
		local max = screen:frame()

		frame.y = max.y
		frame.h = max.h / 2
		window:setFrame(frame)
	end,

	-- Resize current window to half its height without changing its wiedth
	-- if the current window is taking up the left 50% of the screen,
	-- resizing with `bottom` changes current window to bottom left 25% of screen
	-- if the current window takes up the whole screen,
	-- resizing with `bottom` changes current window to bottom 50% of screen
	bottom = function()
		local window = hs.window.focusedWindow()
		local frame = window:frame()
		local screen = window:screen()
		local max = screen:frame()

		frame.y = max.y + (max.h / 2)
		frame.h = max.h / 2
		window:setFrame(frame)
	end,

	-- Maximize application without going full screen
	maximize = function()
		local window = hs.window.focusedWindow()
		window:move(hs.layout.maximized)
	end,
}

local focus = {
	left = function()
		local window = hs.window.focusedWindow()
		window:focusWindowWest(nil, false, false)
	end,
	right = function()
		local window = hs.window.focusedWindow()
		window:focusWindowEast(nil, false, false)
	end,
	top = function()
		local window = hs.window.focusedWindow()
		window:focusWindowNorth(nil, false, false)
	end,
	bottom = function()
		local window = hs.window.focusedWindow()
		window:focusWindowSouth(nil, false, false)
	end,
}

-- Window Resizing
hs.hotkey.bind({ "cmd", "shift" }, "H", tile_window.left)
hs.hotkey.bind({ "cmd", "shift" }, "L", tile_window.right)
hs.hotkey.bind({ "cmd", "shift" }, "K", tile_window.top)
hs.hotkey.bind({ "cmd", "shift" }, "J", tile_window.bottom)
hs.hotkey.bind({ "cmd", "shift" }, "O", tile_window.maximize)

-- Window Focus
hs.hotkey.bind({ "cmd" }, "H", focus.left)
hs.hotkey.bind({ "cmd" }, "L", focus.right)
hs.hotkey.bind({ "cmd" }, "K", focus.top)
hs.hotkey.bind({ "cmd" }, "J", focus.bottom)

hs.hotkey.bind({ "cmd", "shift" }, "R", hs.reload)

-- All lines below are run whenever the script is reloaded
hs.alert.show("Hammerspoon Config Reloaded")
