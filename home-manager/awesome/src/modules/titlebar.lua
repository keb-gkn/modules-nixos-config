-----------------------------------
-- This is the titlebar module --
-----------------------------------

-- Awesome Libs
local awful = require("awful")
local color = require("src.theme.colors")
local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")
require("src.core.signals")

-- Icon directory path
local icondir = awful.util.getdir("config") .. "src/assets/icons/titlebar/"

awful.titlebar.enable_tooltip = true
awful.titlebar.fallback_name = 'Client'

local double_click_event_handler = function(double_click_event)
  if double_click_timer then
    double_click_timer:stop()
    double_click_timer = nil
    double_click_event()
    return
  end
  double_click_timer = gears.timer.start_new(
    0.20,
    function()
      double_click_timer = nil
      return false
    end
  )
end

local create_click_events = function(c)
  local buttons = gears.table.join(
    awful.button(
      {},
      1,
      function()
        double_click_event_handler(function()
          if c.floating then
            c.float = false
            return
          end
          c.maximized = not c.maximized
          c:raise()
        end)
        c:activate { context = 'titlebar', action = 'mouse_move' }
      end
    ),
    awful.button(
      {},
      3,
      function()
        c:activate { context = 'titlebar', action = 'mouse_resize' }
      end
    )
  )
  return buttons
end

local create_titlebar = function(c, bg, size)
  local titlebar = awful.titlebar(c, {
    position = "top",
    bg = bg,
    size = size
  })

  titlebar:setup {
    {
      {
        widget = awful.widget.clienticon(c)
      },
      margins = dpi(5),
      widget = wibox.container.margin
    },
    {
      buttons = create_click_events(c),
      layout = wibox.layout.flex.horizontal
    },
    {
      {
        {
          awful.titlebar.widget.minimizebutton(c),
          widget = wibox.container.background,
          bg = color["nord14"],
          shape = function(cr, height, width)
            gears.shape.rounded_rect(cr, width, height, 4)
          end,
          id = "minimizebutton"
        },
        {
          awful.titlebar.widget.maximizedbutton(c),
          widget = wibox.container.background,
          bg = color["nord13"],
          shape = function(cr, height, width)
            gears.shape.rounded_rect(cr, width, height, 4)
          end,
          id = "maximizebutton"
        },
        {
          awful.titlebar.widget.closebutton(c),
          widget = wibox.container.background,
          bg = color["nord11"],
          shape = function(cr, height, width)
            gears.shape.rounded_rect(cr, width, height, 4)
          end,
          id = "closebutton"
        },
        spacing = dpi(10),
        layout  = wibox.layout.fixed.horizontal,
        id      = "spacing"
      },
      margins = dpi(8),
      widget = wibox.container.margin,
      id = "margin"
    },
    layout = wibox.layout.align.horizontal,
    id = "main"
  }
  Hover_signal(titlebar.main.margin.spacing.closebutton, color["nord11"], color["nord0"])
  Hover_signal(titlebar.main.margin.spacing.maximizebutton, color["nord13"], color["nord0"])
  Hover_signal(titlebar.main.margin.spacing.minimizebutton, color["nord14"], color["nord0"])
end

local create_titlebar_dialog = function(c, bg, size)
  local titlebar = awful.titlebar(c, {
    position = "top",
    bg = bg,
    size = size
  })

  titlebar:setup {
    {
      {
        {
          awful.titlebar.widget.closebutton(c),
          widget = wibox.container.background,
          bg = color["nord11"],
          shape = function(cr, height, width)
            gears.shape.rounded_rect(cr, width, height, 4)
          end,
          id = "closebutton"
        },
        {
          awful.titlebar.widget.minimizebutton(c),
          widget = wibox.container.background,
          bg = color["nord14"],
          shape = function(cr, height, width)
            gears.shape.rounded_rect(cr, width, height, 4)
          end,
          id = "minimizebutton"
        },
        spacing = dpi(10),
        layout  = wibox.layout.fixed.horizontal,
        id      = "spacing"
      },
      margins = dpi(8),
      widget = wibox.container.margin,
      id = "margin"
    },
    {
      buttons = create_click_events(c),
      layout = wibox.layout.flex.horizontal
    },
    {
      {
        widget = awful.widget.clienticon(c)
      },
      margins = dpi(5),
      widget = wibox.container.margin
    },
    layout = wibox.layout.align.horizontal,
    id = "main"
  }
  Hover_signal(titlebar.main.margin.spacing.closebutton, color["nord11"], color["nord0"])
  Hover_signal(titlebar.main.margin.spacing.minimizebutton, color["nord14"], color["nord0"])
end

local draw_titlebar = function(c)
  if c.type == 'normal' and not c.requests_no_titlebar then
        create_titlebar(c, color["nord3"], 35)
    elseif c.type == 'dialog' then
        create_titlebar_dialog(c, color["nord3"], 35)
  end
end

function handle_maximized_button(c)
    if c.maximized then
        Theme.titlebar_maximized_button_normal = icondir .. "unmaximize.svg"
        Theme.titlebar_maximized_button_active = icondir .. "unmaximize.svg"
        Theme.titlebar_maximized_button_inactive = icondir .. "unmaximize.svg"
    else
        Theme.titlebar_maximized_button_normal = icondir .. "maximize.svg"
        Theme.titlebar_maximized_button_active = icondir .. "maximize.svg"
        Theme.titlebar_maximized_button_inactive = icondir .. "maximize.svg"
    end
end

function handle_showing_titlebar(c)
    if c.type == "normal" then
        if c.floating or (c.screen.selected_tag.layout.name == "floating") then
            awful.titlebar.hide(c, 'left')
            awful.titlebar.hide(c, 'right')
            awful.titlebar.show(c, 'top')
            awful.titlebar.hide(c, 'bottom')
        else
            awful.titlebar.hide(c, 'left')
            awful.titlebar.hide(c, 'right')
            awful.titlebar.hide(c, 'top')
            awful.titlebar.hide(c, 'bottom')
        end
    end
end

function handle_maximized_state_in_tile_layout(c)
    if c.screen.selected_tag.layout.name == "tile" then
        c.maximized = false;
        if c.type == "normal" then
            c.floating = false;
        end
    end
end

client.connect_signal(
  "property::maximized",
  function(c)
    handle_maximized_button(c)
  end
)

client.connect_signal(
  "request::titlebars",
  function(c)
    handle_maximized_button(c)
    draw_titlebar(c)
    handle_showing_titlebar(c)
  end
)

client.connect_signal(
  "property::floating",
  function(c)
    handle_showing_titlebar(c)
    if not c.floating then
        c.maximized = false;
    end
  end
)

client.connect_signal(
  "manage",
  function(c)
    handle_showing_titlebar(c)
    handle_maximized_state_in_tile_layout(c)
  end
)

tag.connect_signal(
  "property::layout",
  function(t)
    for _, c in ipairs(t.screen.all_clients)
    do
      handle_showing_titlebar(c)
      handle_maximized_state_in_tile_layout(c)
    end
  end
)
