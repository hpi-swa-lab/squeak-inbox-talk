*SqueakInboxTalkTests-preferences
shouldIncludeSmartSummary: aBoolean during: aBlock

	| previous |
	previous := ShouldIncludeSmartSummary.
	ShouldIncludeSmartSummary := aBoolean.
	^ aBlock ensure: [
		ShouldIncludeSmartSummary := previous]