snapshotting
takeSnapshotOfConversation: aConversation

	^ self
		takeSnapshotOfObject: aConversation
		properties: #(#contributions #contributionState #hasContributions #hyperkittyUrl #inbox #initialMessage #latestDate #messages #nabbleUrl #pipermailUrl #simpleSubject #subject #text)