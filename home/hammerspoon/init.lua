-- Load EmmyLua annotations for language server auto-completion
hs.loadSpoon("EmmyLua")

local function tile_window(direction)
	return function()
		local window = hs.window.focusedWindow()

		-- Which screen/monitor the current window is on
		local window_screen = window:screen()

		-- The dimensions of the current screen/monitor
		local screen_frame = window_screen:frame()

		-- The dimensions of the current screen
		local window_frame = window:frame()

		-- The ratio of the current window frame in relation to its screen/monitor
		local window_layout = window_frame:toUnitRect(screen_frame)

		if direction == "left" then
			-- If the window is already tiled to the left 50% of the screen
			-- and a monitor exists to the left of this widow,
			-- move window to the right half of the left monitor
			if window_layout:equals(hs.layout.left50) and window_screen:toWest() then
				window:moveOneScreenWest({})
				window:move(hs.layout.right50)
			elseif not window_layout:equals(hs.layout.left50) then
				window:move(hs.layout.left50)
			end
		elseif direction == "right" then
			-- If the window is already tiled to the right 50% of the screen
			-- and a monitor exists to the right of this widow,
			-- move window to the left half of the right monitor
			if window_layout:equals(hs.layout.right50) and window_screen:toEast() then
				window:moveOneScreenEast({ noResize = false, ensureInScreenBounds = true })
				window:move(hs.layout.left50)
			elseif not window_layout:equals(hs.layout.right50) then
				window:move(hs.layout.right50)
			end
		elseif direction == "top" then
			-- Resize current window to half its height without changing its width
			-- if the current window is taking up the left 50% of the screen,
			-- resizing with `top` changes current window to top left 25% of screen
			-- if the current window takes up the whole screen,
			-- resizing with `top` changes current window to top 50% of screen
			window_frame.y = screen_frame.y
			window_frame.h = screen_frame.h / 2
			window:setFrame(window_frame)
		elseif direction == "bottom" then
			-- If the current window's height is less than half the height of the screen and
			-- Resize current window to half its height without changing its width
			-- and move window to the bottom part of the screen
			window_frame.y = screen_frame.y + (screen_frame.h / 2)
			window_frame.h = screen_frame.h / 2
			window:setFrame(window_frame)
		end
	end
end

local function maximize_window()
	local window = hs.window.focusedWindow()
	window:move(hs.layout.maximized)
end

local function change_window_focus(direction)
	return function()
		local window = hs.window.focusedWindow()

		if direction == "left" then
			window:focusWindowWest(nil, true, true)
		elseif direction == "right" then
			window:focusWindowEast(nil, true, true)
		elseif direction == "top" then
			window:focusWindowNorth(nil, true, true)
		elseif direction == "bottom" then
			window:focusWindowSouth(nil, true, true)
		end
	end
end

-- Window Resizing
hs.hotkey.bind({ "cmd", "shift" }, "H", tile_window("left"))
hs.hotkey.bind({ "cmd", "shift" }, "L", tile_window("right"))
hs.hotkey.bind({ "cmd", "shift" }, "K", tile_window("top"))
hs.hotkey.bind({ "cmd", "shift" }, "J", tile_window("bottom"))
hs.hotkey.bind({ "cmd", "shift" }, "O", maximize_window)

-- Window Focus
hs.hotkey.bind({ "cmd" }, "H", change_window_focus("left"))
hs.hotkey.bind({ "cmd" }, "L", change_window_focus("right"))
hs.hotkey.bind({ "cmd" }, "K", change_window_focus("top"))
hs.hotkey.bind({ "cmd" }, "J", change_window_focus("bottom"))

hs.hotkey.bind({ "cmd", "shift" }, "R", hs.reload)

-- All lines below are run whenever the script is reloaded
hs.alert.show("Hammerspoon Config Reloaded")
