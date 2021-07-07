snapshotting
takeSnapshotOfCollection: aCollection class: collectionClass

	^ {
		'({1} new ' format: {collectionClass}.
		(aCollection
			collect: [:ea | 'add: {1}; ' format: {self takeSnapshotOf: ea}]
			as: OrderedCollection) join.
		'yourself)'} join