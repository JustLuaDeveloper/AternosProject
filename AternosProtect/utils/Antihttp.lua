local realGenv = getgenv()

setmetatable(realGenv, {
    __newindex = function(t, k, v)
        if tostring(k) == "request" then
            error("⚠️ Security: Cannot modify 'request' function!")
            return
        end
        rawset(t, k, v)
    end
})

print("Request protection activated!")
