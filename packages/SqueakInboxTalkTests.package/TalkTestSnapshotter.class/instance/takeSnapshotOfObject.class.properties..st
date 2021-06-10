snapshotting
takeSnapshotOfObject: anObject class: dictionaryClass properties: properties

	(properties notEmpty and: [stack includes: anObject]) ifTrue: ["Tail recursion"
	^ self takeSnapshotOfObject: anObject properties: #()].
	
	properties isDictionary ifFalse: [
		^ self takeSnapshotOfObject: anObject properties: (properties
			collect: [:property | (self stringifyProperty: property) -> property]
			as: OrderedDictionary)].
	
	stack addFirst: anObject.
	^ [
		{
			'({1} new ' format: {dictionaryClass}.
			((OrderedDictionary new
				add: self keyProperty;
				, properties) associations collect: [:property |
				'at: <1p> put: <2s>; '
					expandMacrosWith: property key
					with: (self takeSnapshotOf: (property value value: anObject))]) join.
			'yourself)'} join] ensure: [stack remove: anObject]