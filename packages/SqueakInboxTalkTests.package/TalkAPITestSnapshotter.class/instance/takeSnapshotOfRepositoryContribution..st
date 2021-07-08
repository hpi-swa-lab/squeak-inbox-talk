snapshotting
takeSnapshotOfRepositoryContribution: aContribution

	^ self takeSnapshotOfObject: aContribution properties: {
		#conversations.
		#date.
		#diffText.
		#latestConversation.
		#inbox.
		#message.
		#messageText.
		#package.
		#project.
		#shortSummary.
		#state.
		#summary.
		[:contribution | contribution version summary].
		[:contribution | contribution versionInfo name].
		#versionName}