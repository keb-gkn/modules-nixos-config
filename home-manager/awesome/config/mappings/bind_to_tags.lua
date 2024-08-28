-- Awesome Libs
local awful = require("awful")
local gears = require("gears")
local globalkeys = require("../mappings/global_keys")
local modkey = user_vars.modkey

for i = 1, 9 do
	globalkeys = gears.table.join(
		globalkeys,

		-- View tag only
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
			client.emit_signal("tag::switched")
		end, { description = "View Tag " .. i, group = "Tag" }),
		-- Brings the window over without chaning the tag, reverts automatically on tag change
		awful.key({ modkey, "Control" }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "Toggle Tag " .. i, group = "Tag" }),
		-- Brings the window over without chaning the tag, reverts automatically on tag change
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
            if client.focus then
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
                client.focus:move_to_tag(tag)
            end
		end, { description = "Move focused client on tag " .. i, group = "Tag" })
	)
end
root.keys(globalkeys)
