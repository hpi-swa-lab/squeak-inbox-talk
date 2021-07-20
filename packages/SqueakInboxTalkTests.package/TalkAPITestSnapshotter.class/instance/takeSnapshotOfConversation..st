snapshotting
takeSnapshotOfConversation: aConversation

	^ self
		takeSnapshotOfObject: aConversation
		properties: #(#contributions #contributionState #hasContributions #inbox #initialMessage #latestDate #messages #nabbleUrl #pipermailUrl #simpleSubject #subject #text)