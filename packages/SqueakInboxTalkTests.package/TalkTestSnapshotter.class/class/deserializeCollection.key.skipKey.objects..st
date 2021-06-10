deserialization
deserializeCollection: aCollection key: aSymbol skipKey: aBoolean objects: objects

	^ aCollection collect: [:ea | self deserialize: ea key: aSymbol skipKey: aBoolean objects: objects] as: ((aCollection isKindOf: Set) ifTrue: [IdentitySet "cannot nest Sets recursively (infinite recursion in #hash)"] ifFalse: [aCollection class])