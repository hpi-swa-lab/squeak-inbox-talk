snapshotting
takeSnapshotOfConversation: aConversation

	^ self
		takeSnapshotOfObject: aConversation
		properties: #(#contributions #hasContributions #inbox #initialMessage #latestDate #messages #nabbleUrl #pipermailUrl #simpleSubject #subject #text)