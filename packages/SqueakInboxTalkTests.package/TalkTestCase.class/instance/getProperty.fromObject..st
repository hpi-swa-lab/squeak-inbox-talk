private
getProperty: property fromObject: anObject

	(property respondsTo: #value:) ifTrue: [^ property value: anObject].
	
	^ self getProperty: (Compiler evaluate: property) fromObject: anObject