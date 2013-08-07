
proto-scope
-------

Writes objects without `class`, but in the prototype way.

```
npm install --save proto-scope
```

and:

```coffee
{proto} = require 'proto-scope'
print = (args...) -> console.log args...

human = proto.new
  init: (@name) ->
  introduce: -> print "this is #{@name}"

tom = human.new()
tom.init 'Tom'
tom.introduce()

man = human.new
  speak: ->
    print 'this is a man'
dan = man.new()
dan.init 'Dan'
dan.introduce()
dan.speak()
```

Also available for JavaScript:

```js
var dan, human, man, print, tom,
  __slice = [].slice;

print = function() {
  var args;
  args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
  return console.log.apply(console, args);
};

human = proto["new"]({
  init: function(name) {
    this.name = name;
  },
  introduce: function() {
    return print("this is " + this.name);
  }
});

tom = human["new"]();

tom.init('Tom');

tom.introduce();

man = human["new"]({
  speak: function() {
    return print('this is a man');
  }
});

dan = man["new"]();

dan.init('Dan');

dan.introduce();

dan.speak();
```

### Use case

Read this for more details: http://javascript.info/tutorial/inheritance

Notice: this can not be widely used, since `__proto__` is not supported in some platforms.

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