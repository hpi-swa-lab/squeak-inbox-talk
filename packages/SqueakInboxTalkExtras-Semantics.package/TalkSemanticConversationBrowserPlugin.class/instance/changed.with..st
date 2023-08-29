updating
changed: aspect with: anObject

	aspect = #insertTextReplacement ifTrue:
		[self browser ifNotNil: [:actualBrowser |
			actualBrowser selectedSpecialMessage ifNotNil: [:specialMessage |
				anObject first = specialMessage second "textSelector" ifTrue:
					[actualBrowser changed: aspect with: (anObject copy at: 1 put: #currentText; yourself)]]]].
	
	super changed: aspect with: anObject.