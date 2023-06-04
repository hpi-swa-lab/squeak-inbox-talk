updating
update: aspect

	aspect = self searcher ifTrue: [self changed: #searchTerm].
	
	^ super update: aspect