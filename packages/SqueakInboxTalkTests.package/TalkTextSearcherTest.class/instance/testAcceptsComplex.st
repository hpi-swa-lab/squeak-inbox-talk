tests - filtering
testAcceptsComplex

	| filter bar foo fooBar |
	foo := self
		patchNewAt: #visitBySearcher:context:
		with: [:this :searcher :stream | searcher term = 'foo' ifTrue: [stream nextPut: #hit]].
	bar := self
		patchNewAt: #visitBySearcher:context:
		with: [:this :searcher :stream | searcher term = 'bar' ifTrue: [stream nextPut: #hit]].
	fooBar := self patchNewAt: #visitBySearcher:context: with: [:this :searcher :stream |
		searcher term = 'foo' ifTrue: [stream nextPut: #hit].
		searcher term = 'bar' ifTrue: [stream nextPut: #hit]].
	
	filter := self classUnderTest new
		newTerm: 'foo bar';
		hasComplexTerm: true;
		yourself.
	
	self deny: (filter accepts: foo).
	self deny: (filter accepts: bar).
	self assert: (filter accepts: fooBar)