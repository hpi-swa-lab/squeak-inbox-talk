updating
update: aspect with: anObject
	"Propagate updates from nested models."

	aspect = #selectResult ifTrue: [self selectNextMatch: anObject].
	
	^ super update: aspect with: anObject