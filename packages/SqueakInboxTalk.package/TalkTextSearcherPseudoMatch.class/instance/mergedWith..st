copying
mergedWith: anotherMatch

	self assert: {self object. self key} = {anotherMatch object. anotherMatch key}.
	"self assert: (anotherMatch contents beginsWith: self contents)."
	^ (anotherMatch withStart: self start stop: (self stop max: anotherMatch stop)) addOriginalMatch: self