
proto-scope
-------

Writes objects without `class`, but in the prototype way.


### Usage

```
npm install --save proto-scope
```

Here is a demo of using it:

```coffee
proto = require 'proto-scope'
```

* Inherent

Passing object to `proto.as` to create sub-class,
passing object to `proto.new` to create instance:

```coffee
human = proto.as
  init: -> @name = 'human race'
  give_name: (@name) ->
  introduce: -> console.log "this is #{@name}"

tom = human.new()
tom.introduce() # => "this is human race"

man = human.as
  speak: ->
    print 'speaks by', @name
dan = man.new()
dan.give_name 'Dan'
dan.introduce() # => "this is Dan"
dan.speak() # => "speaks by Dan"
```

* Super

```coffee
a = proto.as
  init: ->
    console.log 'this is a'
b = a.as
  init: ->
    console.log 'this is b'
    @super()
c = b.new
  init: ->
    console.log 'this is c'
    @super()
```


### Implementation

the difference between `new` and `as` is: `new` contains `@init?()`:

```coffee
module.exports =
  as: (object) ->
    o = object or {}
    o.__proto__ = @
    o
  new: (object) ->
    o = @as object
    o.init?()
    o
```

Also, we my need `super`, so dirty code comes:

```coffee
module.exports =
  as: (object) ->
    o = object or {}
    o.__called__ = undefined
    o.__proto__ = @
    for key, value of o
      f = (key, value) ->
        if typeof value is 'function'
          if key in ['as', 'new', 'super']
            return
          o[key] = (args...) ->
            o.__called__ = key
            value.apply o, args
          o[key].toString = ->
            value.toString()
      f key, value
    o
  super: ->
    @__proto__[@__called__]?()
```

Read this for more details: http://javascript.info/tutorial/inheritance
Also available for JavaScript if you like that kind of life style...


### Limitations

This can not be widely used, since `__proto__` is not supported in some platforms.

Actually there are some problems implementing OOP with prototype,
and more people choose using `class`, but prototype is a simple concept.

### Learn from Lua

This is kind of syntax from Lua: http://www.lua.org/pil/16.1.html

```lua
function Account:new (o)
    o = o or {}   -- create object if user does not provide one
    setmetatable(o, self)
    self.__index = self
    return o
  end
```


### License

MIT
