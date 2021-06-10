snapshotting
takeSnapshotOfDictionary: aDictionary

	(aDictionary keys allSatisfy: #isSymbol) ifFalse: [^ self takeSnapshotOfCollection: aDictionary associations class: Dictionary].
	
	^ self
		takeSnapshotOfObject: aDictionary
		properties: (aDictionary keys collect: [:key | key -> [:object | object at: key]] as: Dictionary)