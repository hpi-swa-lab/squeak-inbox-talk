updating
update: aspect

	(self filters includes: aspect) ifTrue: [self changed].
	
	^ super update: aspect