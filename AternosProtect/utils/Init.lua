local function req(url)
    return loadstring(game:HttpGet(url))()
end
local items = {
    AntiHttp = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/Antihttp.lua",
    SearchFilter = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/SearchFilter.lua",
    SendWebHook = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/SendWebHook.lua",
}

local utils = {}

for name, item in pairs(items) do
    if type(item) == "string" and item:match("^https?://") then
        utils[name] = function(...)
            local f = req(item)
            utils[name] = f
            return f(...)
        end
    else
        utils[name] = item
    end
end

return utils
