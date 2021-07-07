accessing
predicateBlock

	(self predicate respondsTo: #value:) ifTrue: [^ self predicate].
	
	^ [:conversation |
		self predicate
			valueWithReceiver: self inbox
			arguments: {self makeFilterContextFor: conversation}]