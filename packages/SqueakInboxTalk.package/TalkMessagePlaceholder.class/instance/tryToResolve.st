accessing
tryToResolve

	| message |
	message := self inbox messageForId: self messageId.
	message isPlaceholder ifTrue: [^ self].
	^ self becomeForward: message