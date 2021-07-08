*SqueakInboxTalk-UI-accessing
summaryWithState

	| lines |
	lines := self summary lines as: Array.
	lines ifEmpty: [^ super summaryWithState].
	lines at: 1 put: ('{1} ({2})' format: {lines at: 1. self state}).
	^ lines joinSeparatedBy: String cr