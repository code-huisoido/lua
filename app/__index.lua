ngx.say("hello __index元方法", "<br/>")

--__index元方法
--第一种写法
other = { foo = 3}
t = setmetatable({}, { __index = other })
ngx.say(t.foo, "<br/>")

--第二种写法
mytable = setmetatable({key1 = "value1"}, {
    __index = function(mytable, key)
        if key == "key2" then
            return "metatablevalue"
        else
            return nil
        end
    end
})

ngx.say(mytable.key1, "<br/>", mytable.key2)
