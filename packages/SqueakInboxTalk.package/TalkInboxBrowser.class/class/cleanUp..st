initialize-release
cleanUp: aggressive

	aggressive ifTrue: [
		SelfUpdateWorkingCopy := nil.
		UseSimpleIcons := nil].
	Icons := Dictionary new