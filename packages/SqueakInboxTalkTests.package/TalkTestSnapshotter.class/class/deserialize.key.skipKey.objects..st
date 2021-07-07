deserialization
deserialize: anObject key: aSymbol skipKey: aBoolean objects: objects
	"Deseralize the passed tree structure into a direct graph and restore potential loops that are represented by nodes with a single key symbol in the dictionary that is unique in the tree. If skipTree is true, these keys will be removed from the deserialized structure. objects is an internal map of all identified loops."

	anObject isDictionary ifTrue: [^ self deserializeDictionary: anObject key: aSymbol skipKey: aBoolean objects: objects].
	(anObject isCollection and: [anObject isString not]) ifTrue: [^ self deserializeCollection: anObject key: aSymbol skipKey: aBoolean objects: objects].
	^ anObject