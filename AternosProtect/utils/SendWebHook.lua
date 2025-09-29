local MainR = (syn and syn.request)
    or (http and http.request)
    or request
    or httprequest
    or (fluxus and fluxus.request)
    or http_request

return function(webhook, data)
    if not MainR then
        warn("No HTTP request function available")
        return
    end

    local success, response = pcall(function()
        print("Sending webhook")
        return MainR({
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
    elseif response and response.StatusCode == 404 then
        warn("Failed to send: Invalid Webhook")
    elseif not (response and response.StatusCode and response.StatusCode >= 200 and response.StatusCode < 300) then
        warn("Webhook error, status: " .. tostring(response and response.StatusCode))
    end
end


