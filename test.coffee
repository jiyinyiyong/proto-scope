
{proto} = require './proto.coffee'
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