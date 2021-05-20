evaluation
valueWithReceiver: receiver arguments: arguments

	behavior isNil ==> [receiver == object] ifFalse: [
		^ method = #new
			ifTrue: [receiver doesNotUnderstand: (Message selector: nil arguments: arguments)]
			ifFalse: [method valueWithReceiver: receiver arguments: arguments]].
	^ block valueWithEnoughArguments: (arguments copyWithFirst: receiver)