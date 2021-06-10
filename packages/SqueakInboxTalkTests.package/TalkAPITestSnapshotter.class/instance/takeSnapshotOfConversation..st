snapshotting
takeSnapshotOfConversation: aConversation

	^ self
		takeSnapshotOfObject: aConversation
		properties: #(#contributions #hasContributions #inbox #initialMessage #latestDate #messages #simpleSubject #subject #text)