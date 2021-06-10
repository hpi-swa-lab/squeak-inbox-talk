snapshotting
takeSnapshotOfDictionary: aDictionary

	^ self
		takeSnapshotOfObject: aDictionary
		properties: (aDictionary keys collect: [:key | key -> [:object | object at: key]] as: Dictionary)