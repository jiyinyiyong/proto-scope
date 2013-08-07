
{proto} = require './proto.coffee'
print = (args...) -> console.log args...

human = proto.new
  init: -> @name = 'human race'
  give_name: (@name) ->
  introduce: -> print "this is #{@name}"

tom = human.new()
tom.introduce()

man = human.as
  speak: ->
    print 'speaks by', @name
dan = man.new()
dan.give_name 'Dan'
dan.introduce()
dan.speak()