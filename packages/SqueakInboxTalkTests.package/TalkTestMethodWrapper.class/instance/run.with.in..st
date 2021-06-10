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
			ifFalse: [receiver perform: aSymbol withArguments: arguments inSuperclass: receiver class superclass]].
	
	^ block isSymbol
		ifTrue: [block cull: receiver]
		ifFalse: [block valueWithEnoughArguments: (arguments copyWithFirst: receiver)]