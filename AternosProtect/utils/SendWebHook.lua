local mainRequst = (syn and syn.request)
    or (http and http.request)
    or request
    or httprequest
    or (fluxus and fluxus.request)
    or http_request

return function(webhook, data)
    if not mainRequst then
        warn("No HTTP request function available")
        return
    end

    local success, response = pcall(function()
        return mainRequst({
            Url = webhook,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = data
        })
    end)

    if not success then
        warn("Failed to send webhook: " .. tostring(response))
    elseif response and response.StatusCode ~= 200 then
        warn("Webhook responded with status: " .. tostring(response.StatusCode))
    end
end
