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
    return file:Create(string.gsub(filelocation, "BRY402", owner.DisplayName), Services.HttpService:GetAsync(url))
end
load("test.lua")