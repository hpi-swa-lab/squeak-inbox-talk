accessing - state
selectedMessageIndex: anInteger

	self selectedMessage: (anInteger isZero ifFalse: [self messages at: anInteger])