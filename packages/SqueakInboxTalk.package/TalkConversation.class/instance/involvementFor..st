accessing - state
involvementFor: aPerson

	self contributions ifNotEmpty: [:contributions |
		((contributions first flag: #todo) wasAuthoredBy: aPerson) ifTrue: ["ensure date order"
		^ #started]].
	
	((self messages first flag: #todo) wasAuthoredBy: aPerson) ifTrue: ["ensure date order"
	^ #started].
	(self messages anySatisfy: [:message | message wasAuthoredBy: aPerson]) ifTrue: [^ #participated].
	(self includesMentionOf: aPerson) ifTrue: [^ #mentioned].
	
	^ nil