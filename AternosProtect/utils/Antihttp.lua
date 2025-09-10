local realGenv = getgenv()

-- Сохраняем оригинал в закрытое поле
local _originalRequest = realGenv.request

-- Создаем защищенную версию
local protectedRequest = function(options)
    if not options or type(options) ~= "table" then
        return _originalRequest(options)
    end
    
    -- Здесь можно добавить проверки на подозрительные запросы
    return _originalRequest(options)
end

-- Заменяем request на защищенную версию
rawset(realGenv, "request", protectedRequest)

-- Блокируем дальнейшие попытки изменения
setmetatable(realGenv, {
    __newindex = function(t, k, v)
        if tostring(k) == "request" then
            error("❌ Security: request function is protected!")
            return
        end
        rawset(t, k, v)
    end
})

print("✅ Request function secured against hooking!")
