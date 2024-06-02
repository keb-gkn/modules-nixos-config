local lfs = require("lfs")

-- directory: string -- the location to walk through
-- recursive: bool -- should or should not walk subdirs :: default false
-- mode: string -- [a, f, d] :: default a
function file_exists(file)
    local f = io.open(file, "rb")
    if f then
        f:close()
    end
    return f ~= nil
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
function readlines(file)
    if not file_exists(file) then
        return {}
    end
    local lines = {}
    for line in io.lines(file) do
        lines[#lines + 1] = line
    end
    return lines
end

function walk(self, directory, recursive, mode)
    recursive = recursive or false
    mode = mode or "a"
	return coroutine.wrap(function()
		for f in lfs.dir(self) do
			if f ~= "." and f ~= ".." then
				local _f = self .. "/" .. f
				if not directory or directory(_f) then
                    if lfs.attributes(_f, "mode") == "directory" then
                        if mode == "a" or mode == "d" then
                            coroutine.yield(_f)
                        end
                    elseif lfs.attributes(_f, "mode") == "file" then
                        if mode == "a" or mode == "f" then
                            coroutine.yield(_f)
                        end
                    end
				end
				if lfs.attributes(_f, "mode") == "directory" then
                    if recursive then
                        for n in walk(_f, directory) do
                            coroutine.yield(n)
                        end
                    end
				end
			end
		end
	end)
end

function list_files(directory)
	local i, t = 0, {}
	for f in walk(directory, false, "f") do
		i = i + 1
		t[i] = f
	end
	return t
end

function list_directories(directory)
    local i, t = 0, {}
	for f in walk(directory, false, "d") do
		i = i + 1
		t[i] = f
	end
	return t

end
