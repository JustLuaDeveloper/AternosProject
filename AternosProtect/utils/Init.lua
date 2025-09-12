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
    AntiHttp = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/Antihttp.lua",
    SearchFilter = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/SearchFilter.lua",
    AutoDelWebhook = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/AutoDelWebhookModule.lua",
    ConsoleDetector = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/ConsoleDetector.lua",
    SendWebHookData = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/SendWebHookData.lua",
    SendWebHook = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/SendWebHook.lua",
    ScriptFilter = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/ScriptFilter.lua",
    BlackList = "https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/BlackList.lua",
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
