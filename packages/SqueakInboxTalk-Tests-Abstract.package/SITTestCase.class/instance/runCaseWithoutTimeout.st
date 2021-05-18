running
runCaseWithoutTimeout

	[
		self setUp.
		self performTest] ensure: [self tearDown]