background workers
backgroundWorkerPriorityFor: aSymbol

	^ (super backgroundWorkerPriorityFor: aSymbol) + (aSymbol
		caseOf: {
			"Give a higher priority to the #contents generation so that the preview will be displayed before all filters have completed."
			[#contents] -> [1].
			"As of now takes too long, do not block other shorter workers"
			[#conversations] -> [-1]}
		otherwise: [0])