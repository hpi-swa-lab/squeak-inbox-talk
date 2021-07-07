evaluation
valueWithReceiver: receiver arguments: arguments

	(self wrapperMatches: receiver) ifFalse: [
		^ self isWrapperForExistingMethod
			ifTrue: [method valueWithReceiver: receiver arguments: arguments]
			ifFalse: [receiver doesNotUnderstand: (Message selector: nil arguments: arguments)]].
	
	^ block valueWithEnoughArguments: (arguments copyWithFirst: receiver)