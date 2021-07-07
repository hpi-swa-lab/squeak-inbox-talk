snapshotting
takeSnapshotOfAssociation: anAssociation

	^ '({1} -> {2})' format: {self takeSnapshotOf: anAssociation key. self takeSnapshotOf: anAssociation value}