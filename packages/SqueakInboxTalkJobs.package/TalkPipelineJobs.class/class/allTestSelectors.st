accessing
allTestSelectors

	self isCI ifFalse: [
		Transcript showln: ('No CI found, skipping {1}' format: {self}).
		^ #()].
	^ super allTestSelectors