local https = game:GetService("HttpService")
return function(channel_id,webhook ,text)
    local data = {
        ["content"] = text,
        ["username"] = "AternosProtect"
    }
    local body = https:JSONEncode(data)
    request({
        Url = "https://discord.com/api/webhooks/" .. channel_id .."/" .. webhook,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = body
    })
end
