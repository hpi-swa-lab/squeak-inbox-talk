accessing
testSelectors

	self isCI ifFalse: [
		Transcript showln: ('No CI found, skipping {1}' format: {self}).
		^ #()].
	^ super testSelectors