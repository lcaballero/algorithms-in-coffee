ordering = require('./OrderHelpers')


describe 'OrderHelpers =>', ->

  { randomNumbers, isOrdered, hasInputSet, hasSameArity } = ordering

  describe 'hasInputSet', ->

    it 'should find the given array sorted', ->
      original  = [1,2,3,4]
      actual    = [1,2,3,4]
      isSubset  = hasInputSet(original, actual)
      expect(isSubset).to.be.true


  describe 'hasSameArity =>', ->

    it 'the arrays should have the same arrity as the original', ->
      original  = [1,2,3,4,1,2]
      actual    = [1,2,3,4,1,2]
      hasArity  = hasSameArity(actual, original)
      expect(hasArity).to.be.true

    it 'the arrays have different arrity', ->
      original  = [1,1,2,3]
      actual    = [1,2,3,]
      hasArity  = hasSameArity(actual, original)
      expect(hasArity).to.be.false


  describe 'isOrdered =>', ->

    it 'should not find a random list of numbers in ordre', ->
      rand = randomNumbers(1,100)
      expect(isOrdered(rand)).to.be.false

    it 'should find an ordered 2 element array ordered', ->
      expect(isOrdered([1,2])).to.be.true

    it 'should find a 1 element array ordered', ->
      expect(isOrdered([1])).to.be.true

    it 'should find a 0 element array ordered', ->
      expect(isOrdered([])).to.be.true

    it 'should find the give array in order', ->
      ar = [1,2,3,4]
      actual = isOrdered(ar)
      expect(actual).to.be.true

    it 'should find the given array out of order', ->
      ar = [3,2,1,4]
      actual = isOrdered(ar)
      expect(actual).to.be.false

    it 'should return true for empty array', ->
      expect(isOrdered([])).to.be.true

    it 'should throw an error for a null array', ->
      expect(-> isOrdered(null)).to.throw(Error)

    it 'should throw an error for a undefined array', ->
      expect(-> isOrdered(undefined)).to.throw(Error)
