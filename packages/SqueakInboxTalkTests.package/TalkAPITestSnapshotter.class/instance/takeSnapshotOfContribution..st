snapshotting
takeSnapshotOfContribution: aContribution

	^ self
		takeSnapshotOfObject: aContribution
		properties: #(#conversations #latestConversation #message #messageText #package #state #summary)