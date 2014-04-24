
module.exports =
  as: (object) ->
    o = object or {}
    o.__called__ = []
    o.__proto__ = @
    for key, value of o
      f = (key, value) ->
        if typeof value is 'function'
          if key in ['as', 'new', 'super']
            return
          o[key] = (args...) ->
            o.__called__.unshift key
            ret = value.apply o, args
            o.__called__.shift()
            ret
          o[key].toString = ->
            value.toString()
      f key, value
    o
  new: (object) ->
    o = @as object
    o.init?()
    o
  super: ->
    @__proto__[@__called__[0]]?()