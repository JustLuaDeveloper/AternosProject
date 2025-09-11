local https = game:GetService("HttpService")
return function(webhook,text)
    local data = {
        ["content"] = text,
        ["username"] = "AternosProtect"
    }
    local body = https:JSONEncode(data)
    request({
        Url = webhook,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = body
    })
end
