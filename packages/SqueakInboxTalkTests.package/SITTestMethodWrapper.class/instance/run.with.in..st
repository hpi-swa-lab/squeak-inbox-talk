evaluation
run: aSymbol with: arguments in: receiver

	(aSymbol = selector and: [behavior isNil ==> [receiver == object]]) ifFalse: [
		^ method = #new
			ifTrue: [receiver doesNotUnderstand: (Message selector: aSymbol arguments: arguments)]
			ifFalse: [method valueWithReceiver: receiver arguments: arguments]].
	^ block valueWithEnoughArguments: (arguments copyWithFirst: receiver)