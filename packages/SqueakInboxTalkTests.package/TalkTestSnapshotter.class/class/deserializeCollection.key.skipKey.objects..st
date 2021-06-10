deserialization
deserializeCollection: aCollection key: aSymbol skipKey: aBoolean objects: objects

	^ aCollection collect: [:ea | self deserialize: ea key: aSymbol skipKey: aBoolean objects: objects]