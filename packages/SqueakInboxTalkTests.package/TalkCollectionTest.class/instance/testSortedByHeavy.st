tests - sorting
testSortedByHeavy

	| collection property sends |
	collection := (1 to: 10) asArray.
	property := #asWords.
	
	self assert: (collection sorted: property ascending) equals: (collection talkSortedByHeavy: property).
	
	sends := Bag new.
	collection talkSortedByHeavy: [:ea |
		sends add: ea.
		property value: ea].
	self assert: sends sortedCounts first value = 1