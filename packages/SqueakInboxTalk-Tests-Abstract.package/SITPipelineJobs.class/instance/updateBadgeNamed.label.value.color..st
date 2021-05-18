badges
updateBadgeNamed: name label: label value: aString color: color

	| content filename |
	filename := ('{1}.json' format: {name}) asFileName.
	content := JsonObject new
		schemaVersion: 1;
		label: label;
		message: aString;
		color: color;
		yourself.
	
	self uploadGist: self badgeGistId filename: filename content: content asJsonString