

###
  @vals {Array} Some number of integers in an array.  Throws an error if the
        value provided is not an array.
###
insertionSort = (vals) ->
  for j in [1...vals.length]
    a = vals[j]
    i = j - 1
    while i >= 0 and vals[i] > a
      vals[i+1] = vals[i]
      i = i - 1
    vals[i+1] = a
  vals


merge = (vals, left, mid, right) ->

  L = []
  R = []

  i = 0; for j in [left...(mid + 1)]
    L[i++] = vals[j]

  i = 0; for j in [(mid + 1)..right]
    R[i++] = vals[j]

  i = 0; j = 0; go_left = 1; go_right = 2

  for k in [left..right]
    move =
      if L[i] < R[j]
      then go_left
      else go_right

    move =
      if i >= L.length then go_right
      else if j >= R.length then go_left
      else move

    switch (move)
      when go_left  then vals[k] = L[i++]
      when go_right then vals[k] = R[j++]
      else
        ''

  console.log(vals)


doMergeSort = (arr, left, right) ->
  if left < right
    delta = (left + right)
    mid   = Math.floor(delta / 2)
    doMergeSort(arr, left, mid)
    doMergeSort(arr, mid + 1, right)
    merge(arr, left, mid, right)


mergeSort = (arr) ->
  doMergeSort(arr, 0, arr.length - 1)
  arr

module.exports =
  insertionSort : insertionSort
  mergeSort     : mergeSort
  merge         : merge