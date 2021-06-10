tests - sorting
testInsertionSorted

	| collection sortBlock sorted |
	collection := (self random next: 1000) asOrderedCollection.
	sortBlock := #sin descending.
	
	sorted := collection talkInsertionSorted: sortBlock.
	
	self assert: (collection sorted: sortBlock) equals: sorted