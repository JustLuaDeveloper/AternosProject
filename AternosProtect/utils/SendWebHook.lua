local http_request = (syn and syn.request) 
    or (http and http.request) 
    or request 
    or httprequest 
    or (fluxus and fluxus.request)
return function(webhook,data)
    http_request({
        Url = webhook,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = data
    })
end
