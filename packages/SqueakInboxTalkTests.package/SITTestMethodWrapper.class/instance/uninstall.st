installation
uninstall

	| class |
	method ifNil: [^ self notify: 'not installed'].
	
	class := behavior ifNil: [object class].
	method = #new
		ifTrue: [class methodDictionary removeKey: selector]
		ifFalse: [class methodDictionary
			at: selector
			put: method].
	method := nil.