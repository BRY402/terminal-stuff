-- index.lua
local url = "https://raw.githubusercontent.com/BRY402/terminal-stuff/main/test/"
display("yeah babyyyy")
local function load(filelocation)
    local split = string.split(url, "/")
    table.remove(split, #split)
    local splitlocation = string.split(filelocation, "/")
    for i = 1, #splitlocation do
        local v = splitlocation[#splitlocation]
        if v == ".." then
            table.remove(split, #split)
            table.remove(splitlocation, i)
        elseif v == "." then
            table.remove(splitlocation, i)
        end
    end
    local url = table.concat(split, "/").."/"..filelocation
    local splitextension = string.split(url, ".")
    local extension = extensions[splitextension[#splitextension]]
    assert(extension, "Invalid extension or none was provided.")
    return extension(HttpService:GetAsync(url))
end
load("test.lua")