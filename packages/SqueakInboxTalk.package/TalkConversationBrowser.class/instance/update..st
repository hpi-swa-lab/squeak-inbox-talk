updating
update: aspect
	"Propagate updates from nested models."

	(#(#search #hasSearchError) includes: aspect) ifTrue: [self changed: aspect].
	aspect = #selectResult ifTrue: [self selectNextMatch: self currentEvent shiftPressed not].
	
	^ super update: aspect