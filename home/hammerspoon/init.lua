-- Adding hs as local variable to make language server happy
local hs

local function tile_window(direction)
	return function()
		local window = hs.window.focusedWindow()

		-- Used for left/right tiling
		local screen = window:screen()
		local window_layout = window:frame():toUnitRect(screen:frame())

		-- Used for top/bottom tiling
		local frame = window:frame()
		local max = screen:frame()

		-- If the window is already tiled to the left 50% of the screen
		-- and a monitor exists to the left of this widow,
		-- move window to the right half of the left monitor
		if direction == "left" then
			if window_layout:equals(hs.layout.left50) and screen:toWest() then
				window:moveOneScreenWest(false, true)
				window:move(hs.layout.right50)
			else
				window:move(hs.layout.left50)
			end

			-- If the window is already tiled to the right 50% of the screen
			-- and a monitor exists to the right of this widow,
			-- move window to the left half of the right monitor
		elseif direction == "right" then
			if window_layout:equals(hs.layout.right50) and screen:toEast() then
				window:moveOneScreenEast(false, true)
				window:move(hs.layout.left50)
			else
				window:move(hs.layout.right50)
			end

			-- Resize current window to half its height without changing its width
			-- if the current window is taking up the left 50% of the screen,
			-- resizing with `top` changes current window to top left 25% of screen
			-- if the current window takes up the whole screen,
			-- resizing with `top` changes current window to top 50% of screen
		elseif direction == "top" then
			frame.y = max.y
			frame.h = max.h / 2
			window:setFrame(frame)

			-- Resize current window to half its height without changing its width
			-- if the current window is taking up the left 50% of the screen,
			-- resizing with `bottom` changes current window to bottom left 25% of screen
			-- if the current window takes up the whole screen,
			-- resizing with `bottom` changes current window to bottom 50% of screen
		elseif direction == "bottom" then
			frame.y = max.y + (max.h / 2)
			frame.h = max.h / 2
			window:setFrame(frame)
		end
	end
end

local function maximize_window()
	local window = hs.window.focusedWindow()
	window:move(hs.layout.maximized)
end

local function change_focus(direction)
	return function()
		local window = hs.window.focusedWindow()

		if direction == "left" then
			window:focusWindowWest(nil, false, false)
		elseif direction == "right" then
			window:focusWindowEast(nil, false, false)
		elseif direction == "top" then
			window:focusWindowNorth(nil, false, false)
		elseif direction == "bottom" then
			window:focusWindowSouth(nil, false, false)
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
hs.hotkey.bind({ "cmd" }, "H", change_focus("left"))
hs.hotkey.bind({ "cmd" }, "L", change_focus("right"))
hs.hotkey.bind({ "cmd" }, "K", change_focus("top"))
hs.hotkey.bind({ "cmd" }, "J", change_focus("bottom"))

hs.hotkey.bind({ "cmd", "shift" }, "R", hs.reload)

-- All lines below are run whenever the script is reloaded
hs.alert.show("Hammerspoon Config Reloaded")
