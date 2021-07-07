support
waitWhileBusy

	[browser backgroundWorkers noneSatisfy: [:process | process isTerminated not]] whileFalse: [
		100 milliSeconds wait].