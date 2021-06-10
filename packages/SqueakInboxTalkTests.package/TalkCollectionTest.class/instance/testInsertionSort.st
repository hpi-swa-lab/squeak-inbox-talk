tests - sorting
testInsertionSort

	| collection sortBlock |
	collection := self random next: 1000.
	sortBlock := #sin descending.
	
	collection talkInsertionSort: sortBlock.
	
	self assert: (collection isSortedBy: sortBlock)