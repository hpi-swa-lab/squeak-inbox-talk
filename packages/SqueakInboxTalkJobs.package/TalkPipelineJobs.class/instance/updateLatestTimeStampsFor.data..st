time stamps
updateLatestTimeStampsFor: name data: timeStamps

	| content filename |
	filename := ('{1}.json' format: {name}) asFileName.
	content := JsonObject new
		timeStamps: timeStamps;
		yourself.
	
	self uploadGist: self latestTimeStampsGistId filename: filename content: content asJsonString.