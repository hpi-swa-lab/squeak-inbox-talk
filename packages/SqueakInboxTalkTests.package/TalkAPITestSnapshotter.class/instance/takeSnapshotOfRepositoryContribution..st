snapshotting
takeSnapshotOfRepositoryContribution: aContribution

	^ self takeSnapshotOfObject: aContribution properties: {
		#conversations.
		#date.
		#diffText.
		#latestConversation.
		 #initialMessage. #inbox.
		#messageText.
		#package.
		#project.
		#repositoryName.
		#shortSummary.
		#state.
		#summary.
		[:contribution | contribution version summary].
		[:contribution | contribution versionInfo name].
		#versionName}