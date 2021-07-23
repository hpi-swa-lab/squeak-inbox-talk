updating
update: aspect
	"Propagate updates from nested models."

	(#(#search #hasSearchError) includes: aspect) ifTrue: [self changed: aspect].
	
	^ super update: aspect