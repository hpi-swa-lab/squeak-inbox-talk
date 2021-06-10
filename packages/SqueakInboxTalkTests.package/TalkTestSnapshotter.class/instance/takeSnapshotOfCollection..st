snapshotting
takeSnapshotOfCollection: aCollection

	^ {
		'(OrderedCollection new '.
		(aCollection
			collect: [:ea | 'add: {1}; ' format: {self takeSnapshotOf: ea}]
			as: OrderedCollection) join.
		'yourself)'} join