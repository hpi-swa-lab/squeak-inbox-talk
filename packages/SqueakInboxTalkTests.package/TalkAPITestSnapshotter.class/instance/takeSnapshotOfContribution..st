snapshotting
takeSnapshotOfContribution: aContribution

	^ self
		takeSnapshotOfObject: aContribution
		properties: #(#conversations #inbox #latestConversation #message #messageText #package #state #summary)