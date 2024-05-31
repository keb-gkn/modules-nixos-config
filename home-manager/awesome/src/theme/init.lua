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

Theme_path = awful.util.getdir("config") .. "/src/theme/"
Theme = {}

dofile(Theme_path .. "theme_variables.lua")

Theme.awesome_icon = Theme_path .. "../assets/icons/ArchLogo.png"
Theme.awesome_subicon = Theme_path .. "../assets/icons/ArchLogo.png"

function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls -alhp "'..directory..'"')
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()
    return t
end

-- Wallpaper
beautiful.wallpaper = function (s)
    local wallpapers = scandir(user_vars.wallpapers_dir)
    table.sort(wallpapers)
    local i = s.index > #wallpapers and #wallpapers or s.index
    gears.wallpaper.maximized(wallpapers[i], s)
end
screen.connect_signal(
    'request::wallpaper',
    function(s)
        if beautiful.wallpaper then
            if type(beautiful.wallpaper) == 'string' then
                gears.wallpaper.maximized(beautiful.wallpaper, s)
            else
                beautiful.wallpaper(s)
            end
        end
    end
)

beautiful.init(Theme)
