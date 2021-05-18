running
wrapTest: executeAroundBlock

	| home savedSender |
	home := thisContext.
	executeAroundBlock value: [
		savedSender := thisContext sender cut: home.
		home
			push: nil;
			jump].
	wrappers addLast: savedSender