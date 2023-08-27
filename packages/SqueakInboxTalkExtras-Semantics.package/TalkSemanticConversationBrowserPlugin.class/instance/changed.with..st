updating
changed: aspect with: anObject

	aspect = #insertTextReplacement ifTrue:
		[self browser selectedSpecialMessage ifNotNil: [:specialMessage |
			anObject first = specialMessage second "textSelector" ifTrue:
				[self browser changed: aspect with: (anObject copy at: 1 put: #currentText; yourself)]]].
	
	super changed: aspect with: anObject.