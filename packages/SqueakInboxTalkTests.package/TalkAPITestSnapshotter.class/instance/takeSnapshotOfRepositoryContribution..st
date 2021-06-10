snapshotting
takeSnapshotOfRepositoryContribution: aContribution

	^ self takeSnapshotOfObject: aContribution properties: {
		#conversations.
		#state.
		#summary.
		#inbox.
		#project.
		[:contribution | contribution version summary].
		[:contribution | contribution versionInfo name].
		#versionName}