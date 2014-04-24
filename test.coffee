
proto = require './proto.coffee'

console.log '-- inherent --'

human = proto.as
  init: -> @name = 'human race'
  give_name: (@name) ->
  introduce: -> console.log "this is #{@name}"

tom = human.new()
tom.introduce()

console.log '-- sub class --'

man = human.as
  speak: ->
    console.log 'speaks by', @name
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