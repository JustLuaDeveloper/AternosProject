local utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/Init.lua"))()
local execut = identifyexecutor() or getexecutorname() or "Unknown"
return function(config)
    print(config.webwords)
    print(config.webhook)
    local text = {
        "➖➖➖➖➖➖➖➖➖➖",
        "[AternosProtect]\nUser Loaded & Executed Script",
        "👤 User: `" .. game.Players.LocalPlayer.Name .. "`",
        "🆔 UserId: `" .. game.Players.LocalPlayer.UserId .. "`",
        "👨🏻‍💻 Executor: `" .. execut .. "`",
        "🏘 Place: `" .. utils.GameName .. "`",
        "⏳ Time: `" .. os.date("%Y-%m-%d %H:%M:%S") .. "`",
        "🎁 Account Age: `" .. game.Players.LocalPlayer.AccountAge .. "` days"
    }
    local cont = table.concat(text, "\n")
    utils.SendWebHook(config.webhook, cont)
    print("[AternosProtect] Loaded...")
    utils.AntiHttp(utils, config)
    print("Search filter..")
    utils.SearchFilter(utils, config)
end
