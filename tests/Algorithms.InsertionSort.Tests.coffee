sorts = require('../src/Algorithm')
ordering = require('./OrderHelpers')


describe 'Algorithms.InsertionSort =>', ->

  { randomNumbers, isOrdered, hasInputSet } = ordering

  describe 'insertionSort', ->

    it 'should produce an array result of the same length given to it', ->
      vals   = randomNumbers()
      actual = sorts.insertionSort(vals)

      expect(actual).to.have.length(vals.length)

    it 'should produce all non-null values', ->
      vals   = randomNumbers()
      actual = _.compact(sorts.insertionSort(vals))
      expect(actual).to.have.length(vals.length)

    it "should produce an array that's in order", ->
      originals   = randomNumbers(1,100)
      vals        = randomNumbers(1,100)
      actual      = sorts.insertionSort(vals)

      expect(hasInputSet(actual, originals), 'input values should be in result').to.be.true
      expect(isOrdered(actual), 'should be sorted').to.be.true


