accessing
withContributions: aBoolean withoutContributions: anotherBoolean

	(aBoolean or: [anotherBoolean]) ifFalse: [^ self reset].
	
	withContributions := aBoolean.
	withoutContributions := anotherBoolean.
	
	self changed