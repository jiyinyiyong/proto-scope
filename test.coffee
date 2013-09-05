
{proto} = require './proto.coffee'
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