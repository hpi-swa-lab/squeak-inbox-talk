deserialization
deserializeDictionary: aDictionary key: aSymbol skipKey: skipKey objects: objects

	| result |
	result := aDictionary copyEmpty.
	
	aDictionary at: aSymbol ifPresent: [:key |
		aDictionary size = 1 ifTrue: [objects at: key ifPresent: [:object | ^ object]].
		objects at: key put: result].
	
	aDictionary keysAndValuesDo: [:key :value | (skipKey and: [key = aSymbol]) ifFalse: [result at: key put: (self deserialize: value key: aSymbol skipKey: skipKey objects: objects)]].
	
	^ result