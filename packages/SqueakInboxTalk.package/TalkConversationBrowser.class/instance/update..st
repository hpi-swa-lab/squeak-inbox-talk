updating
update: aspect
	"Propagate updates from nested models."

	(#(#search #hasSearchError) includes: aspect) ifTrue: [self changed: aspect].
	
	self selectedSpecialMessage ifNotNil: [:specialMessage |
		aspect = specialMessage second "textSelector" ifTrue:
			[self changed: #text].
		aspect = specialMessage third "headerSelector" ifTrue:
			[self changed: #headerText]].
	
	^ super update: aspect