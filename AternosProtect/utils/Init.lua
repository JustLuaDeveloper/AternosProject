local function req(url)
    return loadstring(game:HttpGet(url))()
end
local success, info = pcall(function()
    return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
end)
local placeName = ""
if success then
    placeName = #info.Name > 50 and string.sub(info.Name, 1, 50) .. "..." or info.Name
end
local items = {
    NetworkMonitor = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/SearchFilter.lua",
    GuiMonitor = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/GuiFilter.lua",
    ConsoleMonitor = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/ConsoleDetector.lua",
    AntiInject = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/ScriptFilter.lua",
    AntiDebug = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/AntiDebug.lua",
    AntiHttp = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/Antihttp.lua",
    Kill = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/ProtectUtils/Detect.lua",
    SendWebHookData = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/SendWebHookData.lua",
    SendWebHook = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/SendWebHook.lua",
    BlackList = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/BlackList.lua",
    Optimization = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/Performance/FPSOptimization.lua",
    PingOptimization = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/Performance/PingOptimization.lua",
    GameName = placeName
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
