local originalGenv = getgenv()
local originalG = _G

-- Мониторинг для getgenv()
setmetatable(originalGenv, {
    __newindex = function(t, k, v)
        warn("[AntiHTTP] Global variable modified: " .. tostring(k) .. " = " .. tostring(v))
        rawset(t, k, v) -- Разрешаем изменение, но с предупреждением
    end
})

-- Мониторинг для _G
setmetatable(originalG, {
    __newindex = function(t, k, v)
        warn("[AntiHTTP] Global variable modified via _G: " .. tostring(k) .. " = " .. tostring(v))
        rawset(t, k, v) -- Разрешаем изменение, но с предупреждением
    end
})

-- Блокировка конкретно HTTP функций
local function blockHTTPChanges(t, k, v)
    local key = tostring(k):lower()
    if key:find("http") or key:find("request") or key:find("web") then
        warn("[AntiHTTP] BLOCKED: Attempt to modify HTTP-related function: " .. key)
        return -- Блокируем изменение
    else
        warn("[AntiHTTP] Global variable changed: " .. tostring(k))
        rawset(t, k, v) -- Разрешаем другие изменения
    end
end

-- Устанавливаем более строгий мониторинг
debug.setmetatable(originalGenv, {
    __newindex = blockHTTPChanges
})

debug.setmetatable(originalG, {
    __newindex = blockHTTPChanges
})

-- Дополнительно: мониторинг существующих HTTP функций
local httpFunctions = {
    "request", "HttpGet", "HttpPost", "HttpGetAsync", "HttpPostAsync",
    "syn.request", "http_request", "http"
}

for _, funcName in ipairs(httpFunctions) do
    if originalGenv[funcName] then
        warn("[AntiHTTP] Found existing HTTP function: " .. funcName)
    end
end

warn("[AntiHTTP] Global environment monitoring activated!")
