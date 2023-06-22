accessing - smart summary
requestSmartSummary

	smartSummary := #generating.
	[smartSummary := [self smartSummary] ifError: [:error | '<{1}> ' format: {error}].
	Project current addDeferredUIMessage: [self changed: #smartSummary]]
		forkAt: Processor userBackgroundPriority.