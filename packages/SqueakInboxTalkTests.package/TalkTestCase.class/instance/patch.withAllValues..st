patching
patch: anObject withAllValues: aDictionary

	^ self patch: anObject withAll: (aDictionary collect: [:value | [value]])