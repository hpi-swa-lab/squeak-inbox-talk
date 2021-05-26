feedback
defaultFeedbackText

	| latestTimeStamp |
	latestTimeStamp := ((PackageInfo named: 'SqueakInboxTalk') methods collect: [:method | TimeStamp fromMethodTimeStamp: method timeStamp]) max.
	^ '<br><br><i>Reported from {1}, for version of {2} last updated at {3}.</i>' asTextFromHtml format: {SystemVersion current. self appName. latestTimeStamp}