--------------------------------------------------
--  ██████╗██████╗ ██╗   ██╗██╗     ██╗ █████╗  --
-- ██╔════╝██╔══██╗╚██╗ ██╔╝██║     ██║██╔══██╗ --
-- ██║     ██████╔╝ ╚████╔╝ ██║     ██║███████║ --
-- ██║     ██╔══██╗  ╚██╔╝  ██║     ██║██╔══██║ --
-- ╚██████╗██║  ██║   ██║   ███████╗██║██║  ██║ --
--  ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝╚═╝  ╚═╝ --
--------------------------------------------------
local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
require("src.tools.filesystem_utils")

Theme_path = awful.util.getdir("config") .. "/src/theme/"
Theme = {}

dofile(Theme_path .. "theme_variables.lua")

Theme.awesome_icon = Theme_path .. "../assets/icons/ArchLogo.png"
Theme.awesome_subicon = Theme_path .. "../assets/icons/ArchLogo.png"

-- Wallpaper
beautiful.wallpaper = function(s)
	local wallpapers = list_files(user_vars.wallpapers_dir)
	table.sort(wallpapers)
	local i = s.index > #wallpapers and #wallpapers or s.index
	gears.wallpaper.maximized(wallpapers[i], s)
end
screen.connect_signal("request::wallpaper", function(s)
	if beautiful.wallpaper then
		if type(beautiful.wallpaper) == "string" then
			gears.wallpaper.maximized(beautiful.wallpaper, s)
		else
			beautiful.wallpaper(s)
		end
	end
end)

beautiful.init(Theme)
