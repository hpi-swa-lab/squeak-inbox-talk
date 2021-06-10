snapshotting
takeSnapshotOfMockMailingList: aMockMailingList

	aMockMailingList == self mockMailingList ifFalse: [^ self takeSnapshotOfObject: aMockMailingList].
	
	^ 'list'