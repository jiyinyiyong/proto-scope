
proto-scope
-------

Writes objects without `class`, but in the prototype way.

```
npm install --save proto-scope
```

the difference between `new` and `as` is: `new` contains `@init?()`,
read the inplementation for more:

```coffee
exports.proto =
  new: (object) ->
    child = Object.create @
    child[key] = value for key, value of object
    child.init?()
    child
  as: (object) ->
    child = Object.create @
    child[key] = value for key, value of object
    child
  super: (method) ->
    method = 'init' unless method?
    @__proto__[method]?()
```

Here is a demo of using it:

```coffee

{proto} = require 'proto-scope'
print = (args...) -> console.log args...

console.log '-- inherent --'

human = proto.new
  init: -> @name = 'human race'
  give_name: (@name) ->
  introduce: -> print "this is #{@name}"

tom = human.new()
tom.introduce()

console.log '-- sub class --'

man = human.as
  speak: ->
    print 'speaks by', @name
dan = man.new()
dan.give_name 'Dan'
dan.introduce()
dan.speak()

console.log '-- super --'

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