snapshotting
takeSnapshotOfCollection: aCollection

	^ {
		'(OrderedCollection new '.
		(aCollection
			collect: [:ea | 'add: {1}; ' format: {ea talkTestTakeSnapshotFor: self}]
			as: OrderedCollection) join.
		'yourself)'} join