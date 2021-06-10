snapshotting
takeSnapshotOfDictionary: aDictionary

	self flag: #todo.
	"does this only work for JsonObjects?"
	^ self takeSnapshotOfObject: aDictionary properties: aDictionary keys