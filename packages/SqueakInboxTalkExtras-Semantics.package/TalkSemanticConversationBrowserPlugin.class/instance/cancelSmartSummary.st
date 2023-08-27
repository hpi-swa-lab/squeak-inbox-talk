actions
cancelSmartSummary

	(smartSummary respondsTo: #cancel) ifTrue:
		[smartSummary cancel].