accessing - state
selectHeaderTextForKey: aString interval: anInterval

	| offset |
	offset := (self headerText asString allRangesOfRegexMatches: ('^{1}\\: ' format: {aString escapeForRegex})) first stop.
	
	self basicTextSelection: nil headerSelection: anInterval + offset