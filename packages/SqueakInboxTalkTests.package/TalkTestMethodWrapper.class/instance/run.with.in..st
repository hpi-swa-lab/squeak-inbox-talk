evaluation
run: aSymbol with: arguments in: receiver

	(aSymbol = selector and: [self wrapperMatches: receiver]) ifFalse: [
		^ self isWrapperForExistingMethod
			ifTrue: [
				((thisContext objectClass: method) canUnderstand: #run:with:in:)
					ifTrue: [
						method run: aSymbol with: arguments in: receiver
						"nested wrappers still require the selector"]
					ifFalse: [method valueWithReceiver: receiver arguments: arguments]]
			ifFalse: [
				(self methodClass superclass lookupSelector: aSymbol)
					ifNotNil: [:class | receiver perform: aSymbol withArguments: arguments inSuperclass: class methodClass]
					ifNil: [receiver doesNotUnderstand: (Message selector: aSymbol arguments: arguments)]]].
	
	^ block isSymbol
		ifTrue: [block cull: receiver]
		ifFalse: [block valueWithEnoughArguments: (arguments copyWithFirst: receiver)]