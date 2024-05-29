------------------------------------------------------------------------------------------
-- This is the main themeing file, here are most colors changed                         --
-- If you want to change individual widget colors you will need to edit them seperately --
------------------------------------------------------------------------------------------

-- Awesome Libs
local color = require("src.theme.colors")
local dpi = require("beautiful.xresources").apply_dpi
local gears = require("gears")
local awful = require("awful")

-- Icon directory path
local icondir = awful.util.getdir("config") .. "src/assets/icons/titlebar/"

Theme.font = user_vars.font.bold

Theme.bg_normal = color["nord0"]
Theme.bg_focus = color["nord0"]
Theme.bg_urgent = color["nord11"]
Theme.bg_minimize = color["nord6"]
Theme.bg_systray = color["nord6"]

Theme.fg_normal = color["nord6"]
Theme.fg_focus = color["nord6"]
Theme.fg_urgent = color["nord6"]
Theme.fg_minimize = color["nord6"]

Theme.useless_gap = dpi(5) -- Change this to 0 if you dont like window gaps
Theme.border_width = dpi(1) -- Change this to 0 if you dont like borders
Theme.border_normal = color["nord1"]
--Theme.border_focus = color["Red"] -- Doesnt work, no idea why; workaround is in signals.lua
Theme.border_marked = color["nord11"]

--Theme.menu_submenu_icon = Theme_path .. "assets.ArchLogo.png"
Theme.menu_height = dpi(40)
Theme.menu_width = dpi(200)
Theme.menu_bg_normal = color["nord0"]
Theme.menu_bg_focus = color["nord1"]
Theme.menu_fg_focus = color["nord6"]
Theme.menu_border_color = color["nord1"]
Theme.menu_border_width = dpi(1)
Theme.menu_shape = function(cr, width, heigth)
  gears.shape.rounded_rect(cr, width, heigth, 5)
end

Theme.taglist_fg_focus = color["nord0"]
Theme.taglist_bg_focus = color["nord6"]

Theme.tooltip_border_color = color["nord1"]
Theme.tooltip_bg = color["nord0"]
Theme.tooltip_fg = color["nord13"]
Theme.tooltip_border_width = dpi(4)
Theme.tooltip_gaps = dpi(15)
Theme.tooltip_shape = function(cr, width, heigth)
  gears.shape.rounded_rect(cr, width, heigth, 5)
end

Theme.notification_spacing = dpi(20)

Theme.titlebar_close_button_normal = icondir .. "close.svg"
Theme.titlebar_maximized_button_normal = icondir .. "maximize.svg"
Theme.titlebar_minimize_button_normal = icondir .. "minimize.svg"
Theme.titlebar_maximized_button_active = icondir .. "maximize.svg"
Theme.titlebar_maximized_button_inactive = icondir .. "maximize.svg"

Theme.bg_systray = color["nord9"]
Theme.systray_icon_spacing = dpi(10)

Theme.hotkeys_bg = color["nord0"]
Theme.hotkeys_fg = color["nord6"]
Theme.hotkeys_border_width = 0
Theme.hotkeys_shape = function(cr, width, height)
  gears.shape.rounded_rect(cr, width, height, 10)
end
Theme.hotkeys_description_font = user_vars.font.bold

-- Icon directory path
local layout_path = Theme_path .. "../assets/layout/"

-- Here are the icons for the layouts defined, if you want to add more layouts go to main/layouts.lua
Theme.layout_floating = layout_path .. "floating.svg"
Theme.layout_tile = layout_path .. "tile.svg"
Theme.layout_fullscreen = layout_path .. "fullscreen.svg"
Theme.layout_max = layout_path .. "max.svg"
Theme.layout_cornernw = layout_path .. "cornernw.svg"
