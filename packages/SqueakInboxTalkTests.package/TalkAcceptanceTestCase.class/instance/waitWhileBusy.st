support
waitWhileBusy

	browser containingWindow ifNil: [
		self wrapTest: [:block | | fake |
			fake := SystemWindow new
				model: browser;
				yourself.
			browser addDependent: fake.
			block ensure: [browser removeDependent: fake]]].
	
	[browser backgroundWorkers noneSatisfy: [:process | process isTerminated not]] whileFalse: [10 milliSeconds wait]