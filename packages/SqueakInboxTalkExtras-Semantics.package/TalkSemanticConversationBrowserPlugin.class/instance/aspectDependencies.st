updating
aspectDependencies

	^ super aspectDependencies
		at: #smartSummaryText put: #(smartSummary);
		yourself