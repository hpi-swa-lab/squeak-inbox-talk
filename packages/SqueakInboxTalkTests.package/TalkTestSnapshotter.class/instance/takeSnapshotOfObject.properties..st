snapshotting
takeSnapshotOfObject: anObject properties: properties

	(properties notEmpty and: [stack includes: anObject]) ifTrue: ["Tail recursion"
	^ self takeSnapshotOfObject: anObject properties: #()].
	
	stack addFirst: anObject.
	^ [
		{
			'(Dictionary new '.
			((properties copyWithFirst: self class keyProperty) collect: [:property |
				'at: <1p> put: <2s>; '
					expandMacrosWith: property
					with: (self takeSnapshotOf: (property value: anObject))]) join.
			'yourself)'} join] ensure: [stack remove: anObject]