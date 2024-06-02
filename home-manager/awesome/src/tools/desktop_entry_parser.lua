-- Naive implementation of the Desktop Entry Specification for the purposes of getting needed information from desktop files
-- Do not judge too harshly
-- Written by: Andrei Pufu (CloudyChris@github)
-- You may use this however you want. I take no responsibility. The code is distributed without any warranty and I shall not be held liable if something goes to shit.
-- Desktop Entry Specification:
-- https://specifications.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html

require("src.tools.filesystem_utils")
require("src.tools.string_utils.lua")

function parse_desktop_entry(desktop_entry_file)
    local de = {}
    -- supported desktop entry keys per the Desktop Entry Specification
    -- * for required, nothing for not required
    de["Desktop Entry"] = {}
    de["Desktop Entry"]["Type"] = "" -- string / enum [Application, Link, Directory] -- *
    de["Desktop Entry"]["Version"] = "" -- string --
    de["Desktop Entry"]["Name"] = "" -- localestring -- *
    de["Desktop Entry"]["GenericName"] = "" -- localestring --
    de["Desktop Entry"]["NoDisplay"] = "" -- boolean -- 
    de["Desktop Entry"]["Comment"] = "" -- localestring --
    de["Desktop Entry"]["Icon"] = "" -- iconstring --
    de["Desktop Entry"]["Hidden"] = "" -- boolean --
    de["Desktop Entry"]["OnlyShowIn"] = "" -- string(s) (matched against $XDG_CURRENT_DESKTOP, if match, desktop entry is shown)--
    de["Desktop Entry"]["NotShowIn"] = "" -- string(s) (matched against $XDG_CURRENT_DESKTOP, if match, desktop entry is not shown) --
    -- if an app can be launched with D-Bus (https://specifications.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html#dbus)
    de["Desktop Entry"]["DBusActivatable"] = "" -- boolean --
    de["Desktop Entry"]["TryExec"] = "" -- string --
    -- has some special argument parsing that we WON'T DO but here's the docs (https://specifications.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html#exec-variables)
    de["Desktop Entry"]["Exec"] = "" -- string -- * (if DBusActivatable is not present or set to false, but req always for compatibility)
    de["Desktop Entry"]["Path"] = "" -- string --
    de["Desktop Entry"]["Terminal"] = "" -- boolean --
    de["Desktop Entry"]["Actions"] = "" -- string(s) --
    de["Desktop Entry"]["MimeType"] = "" -- string(s) --
    -- Categories at time of writing [AudioVideo, Audio, Video, Development, Education, Game, Graphics, Network, Office, Science, Settings, System, Utility]
    de["Desktop Entry"]["Categories"] = "" -- string(s) (https://specifications.freedesktop.org/menu-spec/latest/apa.html) --
    -- Must fikkiw the rules used for D-Bus interface names
    de["Desktop Entry"]["Implements"] = "" -- string(s) (https://specifications.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html#interfaces) --
    de["Desktop Entry"]["Keywords"] = "" -- localestring(s) used for searching, not display, should not be redundant with Name and GenericName --
    de["Desktop Entry"]["StartupNotify"] = "" -- boolean (https://specifications.freedesktop.org/startup-notification-spec/startup-notification-0.1.txt) --
    de["Desktop Entry"]["StartupWMClass"] = "" -- string (https://specifications.freedesktop.org/startup-notification-spec/startup-notification-0.1.txt) --
    de["Desktop Entry"]["URL"] = "" -- string -- * (if Type is Link)
    -- hints that this application prefers to be run on a more powerful discrete GPU if available
    de["Desktop Entry"]["PrefersNonDefaultGPU"] = "" -- boolean --
    -- hints that this application had a single main window and does not support having an additional one open. Useful for stuff like steam --
    de["Desktop Entry"]["SingleMainWindow"] = "" -- boolean --

    de["Actions"] = {}

    action_keys = {} -- supported action keys per the Desktop Entry Specification
    action_keys["Name"] = ""
    action_keys["Icon"] = ""
    action_keys["Exec"] = ""

    supported_types = {"Application", "Link", "Directory"}
    -- supported_version = "1.5" -- won't check for it, this is informative, might use in the future

    local de_lines = readlines(desktop_entry_file)
    if #de_lines < 1 then
        return nil
    end

    local de_index = ""
    local de_subindex = ""

    for _, dl in ipairs(de_lines) do
        dl:trim()
        if dl:len() > 0  and dl:sub(1,1) ~= "#" then
            if dl:len() >= 15 and dl:sub(1,15) == "[Desktop Entry]" then
                de_index = "Desktop Entry"
            elseif dl:len() >= 15 and dl:sub(1,15) == "[Desktop Action" then
                de_index = "Action"
                de_subindex = dl:sub(16,#dl-1):trim()
            else
                local line_tb = {}
                local v = ""

                for i, frag in dl:split("=") do
                    line_tb[i] = frag
                end

                for i, frag in ipairs(line_tb:unpack(2,#line_tb)) do
                    if i == 1 then
                        v = v .. frag
                    else
                        v = v .. "=" .. frag
                    end
                end


                if de_index == "Desktop Entry" then
                    if de[de_index][line_tb[1]] then
                       de[de_index][line_tb[1]] = v
                    end
                elseif de_index == "Actions" then
                    if de_subindex then
                        if action_keys[line_tb[1]] then
                            de[de_index][de_subindex][line_tb[1]] = v
                        end
                    end
                end
            end
        end
    end

    return de
end
