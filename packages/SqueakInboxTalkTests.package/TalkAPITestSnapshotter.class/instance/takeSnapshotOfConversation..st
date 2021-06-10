snapshotting
takeSnapshotOfConversation: aConversation

	^ self
		takeSnapshotOfObject: aConversation
		properties: #(#basicSubject #contributions #hasContributions #inbox #initialMessage #latestDate #messages #subject #text)