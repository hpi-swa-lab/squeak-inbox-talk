snapshotting
takeSnapshotOfProject: aProject

	^ self takeSnapshotOfObject: aProject properties: #(#name #inbox #url)