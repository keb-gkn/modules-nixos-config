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
    de["Desktop Entry"] = {}
    de["Desktop Entry"]["Type"] = ""
    de["Desktop Entry"]["Version"] = ""
    de["Desktop Entry"]["Name"] = ""
    de["Desktop Entry"]["GenericName"] = ""
    de["Desktop Entry"]["NoDisplay"] = ""
    de["Desktop Entry"]["Comment"] = ""
    de["Desktop Entry"]["Icon"] = ""
    de["Desktop Entry"]["Hidden"] = ""
    de["Desktop Entry"]["OnlyShowIn"] = ""
    de["Desktop Entry"]["NotShowIn"] = ""
    de["Desktop Entry"]["DBusActivatable"] = ""
    de["Desktop Entry"]["TryExec"] = ""
    de["Desktop Entry"]["Exec"] = ""
    de["Desktop Entry"]["Path"] = ""
    de["Desktop Entry"]["Terminal"] = ""
    de["Desktop Entry"]["Actions"] = ""
    de["Desktop Entry"]["MimeType"] = ""
    de["Desktop Entry"]["Categories"] = ""
    de["Desktop Entry"]["Implements"] = ""
    de["Desktop Entry"]["Keywords"] = ""
    de["Desktop Entry"]["StartupNotify"] = ""
    de["Desktop Entry"]["StartupWMClass"] = ""
    de["Desktop Entry"]["URL"] = ""
    de["Desktop Entry"]["PrefersNonDefaultGPU"] = ""
    de["Desktop Entry"]["SingleMainWindow"] = ""

    de["Actions"] = {}

    action_keys = {} -- supported action keys per the Desktop Entry Specification
    action_keys["Name"] = ""
    action_keys["Icon"] = ""
    action_keys["Exec"] = ""

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
