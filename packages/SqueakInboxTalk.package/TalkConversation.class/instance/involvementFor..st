accessing - state
involvementFor: aPerson

	self flag: #discuss. "Ensure date order - decide about the right place to guarantee this"
	
	self contributions ifNotEmpty: [:contributions |
		(contributions first wasAuthoredBy: aPerson) ifTrue: [
		^ #started]].
	
	(self messages first wasAuthoredBy: aPerson) ifTrue: [
	^ #started].
	(self messages anySatisfy: [:message | message wasAuthoredBy: aPerson]) ifTrue: [^ #participated].
	(self includesMentionOf: aPerson) ifTrue: [^ #mentioned].
	
	^ nil