
exports.proto =
  new: (object) ->
    child = {}
    child.__proto__ = @
    for key, value of object
      child[key] = value
    child.init?()
    child