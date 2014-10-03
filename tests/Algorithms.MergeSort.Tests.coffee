sorts = require('../src/Algorithm')
ordering = require('./OrderHelpers')


describe 'Algorithms.MergeSort =>', ->

  { randomNumbers, isOrdered, hasInputSet, hasSameArity } = ordering

  isSorted = (actual, original) ->
    isOrdered(actual) and hasInputSet(actual, original) and hasSameArity(actual, original)

  it 'should produce all non-null values', ->
    vals   = randomNumbers()
    actual = _.compact(sorts.mergeSort(vals))
    expect(actual).to.have.length(vals.length)


  it.only 'should have ordered the array', ->
    originals   = randomNumbers(1,20)
    vals        = _.clone(originals)
    actual      = sorts.mergeSort(vals)

    expect(isSorted(actual, originals)).to.be.true


  it 'should merge values in place', ->
    originals = [1,3,2,4]
    vals = sorts.merge([].concat(originals), 0, 2, 4)
    console.json(vals)

    expect(vals).to.have.length(originals.length)
    expect(hasInputSet(vals, originals)).to.be.true