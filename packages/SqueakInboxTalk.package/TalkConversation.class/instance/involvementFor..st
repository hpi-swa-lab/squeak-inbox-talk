accessing
involvementFor: aPerson

	self contributions ifNotEmpty: [:contributions |
		((contributions first flag: #todo "ensure date order") wasAuthoredBy: aPerson) ifTrue: [^ #started]].
	
	((self messages first flag: #todo) wasAuthoredBy: aPerson) ifTrue: ["ensure date order"
	^ #started].
	(self messages anySatisfy: [:message | message wasAuthoredBy: aPerson]) ifTrue: [^ #participated].
	(self messages anySatisfy: [:message | message includesMentionOf: aPerson]) ifTrue: [^ #mentioned].
	
	^ nil