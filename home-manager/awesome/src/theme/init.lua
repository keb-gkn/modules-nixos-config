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
local lfs = require("lfs")

Theme_path = awful.util.getdir("config") .. "/src/theme/"
Theme = {}

dofile(Theme_path .. "theme_variables.lua")

Theme.awesome_icon = Theme_path .. "../assets/icons/ArchLogo.png"
Theme.awesome_subicon = Theme_path .. "../assets/icons/ArchLogo.png"


local function walk(self, fn)
  return coroutine.wrap(function()
    for f in lfs.dir(self) do
      if f ~= "." and f ~= ".." then
        local _f = self .. "/" .. f
        if not fn or fn(_f) then
          coroutine.yield(_f)
        end
        if lfs.attributes(_f, "mode") == "directory" then
          for n in walk(_f, fn) do
            coroutine.yield(n)
          end
        end
      end
    end
  end)
end

function scandir(directory)
    local i, t = 0, {}
    for f in walk(directory) do
        i = i + 1
        t[i] = f
    end
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
