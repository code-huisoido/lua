ngx.say("hello __newindex元方法", "<br/>")
--__newindex元方法
mymetatable = {}
--第一种写法
mytable = setmetatable({key1 = "value1"}, {__newindex = mymetatable })
ngx.say(mytable.key1)

mytable.newkey = "新值2"
ngx.say(mytable.newkey, mymetatable.newkey)

mytable.key1 = "新值1"
ngx.say(mytable.key1, mymetatable.key1)
ngx.say("<br/>")
--第二种写法
mytable = setmetatable({key1 = "value1"}, {
    __newindex = function(mytable, key, value)
        rawset(mytable, key, "\""..value.."\"")
    end
})
mytable.key1 = "new value"
mytable.key2 = 4
ngx.say(mytable.key1, "<br/>", mytable.key2)
