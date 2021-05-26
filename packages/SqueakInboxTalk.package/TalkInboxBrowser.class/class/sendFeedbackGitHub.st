feedback
sendFeedbackGitHub

	self inform: ('Click {1} to create an issue' asText format: {'here' asText addAllAttributes: {TextEmphasis bold. TextURL new url: self githubNewIssueUrl}})