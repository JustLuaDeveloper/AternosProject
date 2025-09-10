local old = hookfunction
print("Hookfunction saved:", old)
hookfunction = newcclosure(function(target, func)
    print("Hookfunction called with target:", tostring(target))
    if target == request then
        print("Target is request!")
        return nil
    else
        print("Target is not request, printing:", tostring(target))
    end
    return old(target, func)
end)
print("Hookfunction redefined")
