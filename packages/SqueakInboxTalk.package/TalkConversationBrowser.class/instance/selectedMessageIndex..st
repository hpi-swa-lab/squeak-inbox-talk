accessing - state
selectedMessageIndex: anInteger

	self selectMessage: (anInteger isZero ifFalse: [self messages at: anInteger])