copying
mergedWith: anotherMatch

	self assert: {self object. self key} = {anotherMatch object. anotherMatch key}.
	self assert: self contents = anotherMatch contents.
	
	^ (self withStart: self start stop: (self stop max: anotherMatch stop)) addOriginalMatch: anotherMatch