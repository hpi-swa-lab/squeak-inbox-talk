tests - filtering
testAccepts

	| one two zero filter |
	zero := self patchNewAt: #visitBySearcher:context: with: [].
	one := self
		patchNewAt: #visitBySearcher:context:
		with: [:this :searcher :stream | stream nextPut: #hit].
	two := self patchNewAt: #visitBySearcher:context: with: [:this :searcher :stream |
		stream
			nextPut: #hit;
			nextPut: #anotherHit].
	
	filter := self classUnderTest new.
	
	self assert: (filter accepts: zero).
	self assert: (filter accepts: one).
	self assert: (filter accepts: two).
	
	filter newTerm: 'foo'.
	
	self deny: (filter accepts: zero).
	self assert: (filter accepts: one).
	self assert: (filter accepts: two)