copying
mergedWith: anotherMatch
	"Answer a new version of the receiver with an extended interval that contains both the receiver and the passed anotherMatch."

	self assert: {self object. self key} = {anotherMatch object. anotherMatch key}.
	self assert: self contents = anotherMatch contents.
	
	^ (self withStart: self start stop: (self stop max: anotherMatch stop)) addOriginalMatch: anotherMatch