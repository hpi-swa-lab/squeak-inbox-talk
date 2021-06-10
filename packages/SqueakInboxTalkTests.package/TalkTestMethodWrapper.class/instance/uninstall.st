installation
uninstall

	| class |
	method ifNil: [^ self notify: 'not installed'].
	
	class := behavior ifNil: [object class].
	self isWrapperForExistingMethod
		ifTrue: [class methodDictionary at: selector put: method]
		ifFalse: [class methodDictionary removeKey: selector].
	method := nil