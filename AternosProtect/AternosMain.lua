local utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/JustLuaDeveloper/AternosProject/main/AternosProtect/utils/Init.lua"))()
return function(config)
    print("[AternosProtect] Loaded...")
    utils.AntiHttp(utils, config)
    print("Search filter..")
    utils.SearchFilter(utils, config)
end
