snapshotting
takeSnapshotOfContribution: aContribution

	^ self
		takeSnapshotOfObject: aContribution
		properties: #(#conversations  #initialMessage #inbox #latestConversation #messageText #package #state #summary)