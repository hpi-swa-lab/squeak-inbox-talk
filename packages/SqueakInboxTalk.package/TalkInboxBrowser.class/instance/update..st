updating
update: aspect
	"Propagate updates from nested models."

	aspect = self menuFilter ifTrue: [self changed: #filters].
	
	(#(#search #hasSearchError) includes: aspect) ifTrue: [self changed: aspect].
	
	^ super update: aspect