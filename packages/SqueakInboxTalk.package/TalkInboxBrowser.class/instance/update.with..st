updating
update: aspect with: anObject
	"Propagate updates from nested models."

	aspect = #selectResult ifTrue: [self selectNextResult: anObject].
	
	^ super update: aspect with: anObject