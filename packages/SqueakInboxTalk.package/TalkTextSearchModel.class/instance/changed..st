updating
changed: aspect

	super changed: aspect.
	
	aspect = #searchTerm ifTrue: ["Enforce unaccepted edits the search bar so that #accept: can always be triggered"
	self changed: #editString with: self searchTerm].
	
	(aspect = #searchTerm and: [self hasSearchError not]) ifTrue: [self changed: #search]