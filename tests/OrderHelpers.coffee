randomNumbers = (a=1,b=100) ->
  _.shuffle(n for n in [a...b])


isOrdered = (vals) ->
  i = 0
  while (i < vals.length - 1)
    a = vals[i]
    b = vals[i+1]
    if a > b then return false
    i++
  return true


###
  Checks that the actual and the original have the same set
  of numbers but doesn't verify that they have the same arity.

  So a list of [1,1,2,3] would have the same input set as [1,2,3],
  but different arity.
###
hasInputSet = (actual, original) ->
  msgs = []
  for a in original
    if !(a in actual)
      msgs.push("Missing value: #{a}")

  if msgs.length > 0
    throw new Error(msgs.join("\n"))

  true


###
  Checks that the actual and the original have the same arity.

  So a list of [1,1,2,3] would have the same input set as [1,2,3],
  but different arity and this function would determine that the
  two set's have differrent arity.
###
hasSameArity = (actual, original) ->
  if !actual or !original then return false

  origGroups    = _.groupBy(original, _.identity)
  actualGroups  = _.groupBy(actual, _.identity)

  for g of origGroups
    origGroup = origGroups[g]
    actGroup = actualGroups[g]

    if !actGroup? then return false
    if origGroup.length isnt actGroup.length then return false

    for a in origGroup
      if !(a in actGroup) then return false

  true


module.exports =
  randomNumbers : randomNumbers
  isOrdered     : isOrdered
  hasInputSet   : hasInputSet
  hasSameArity  : hasSameArity