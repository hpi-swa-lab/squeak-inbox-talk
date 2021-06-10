snapshotting
takeSnapshotOfSequenceableCollection: aCollection

	^ self takeSnapshotOfCollection: aCollection class: self objectSequenceClass