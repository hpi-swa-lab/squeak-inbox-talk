searching
previewMatch

	self contributions size = 1 ifTrue: [^ self contributions first previewMatch].
	
	^ self initialMessage previewMatch