
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