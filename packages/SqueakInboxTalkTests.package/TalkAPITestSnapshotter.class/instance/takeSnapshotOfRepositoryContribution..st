snapshotting
takeSnapshotOfRepositoryContribution: aContribution

	^ self
		takeSnapshotOfObject: aContribution
		properties: #(#conversations #state #summary #inbox #project #version #versionInfo #versionName)