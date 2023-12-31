-- index.lua
local url = "https://raw.githubusercontent.com/BRY402/terminal-stuff/main/test/"
display("test stuff")
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
    local filelocation = table.concat(splitlocation, "/")
    url = table.concat(split, "/").."/"..filelocation
    return file:Create(owner.DisplayName.."/"..filelocation, Services.HttpService:GetAsync(url))
end
local file1 = load("test.lua")
display("file '"..tostring(file1).."' loaded")
file1:Run(false)