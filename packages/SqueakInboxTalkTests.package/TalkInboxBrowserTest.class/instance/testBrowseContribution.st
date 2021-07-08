tests
testBrowseContribution

	browser selectConversation: (browser conversations detect: [:conversation | conversation contributions notEmpty]).
	self assert: browser hasContributionsSelected.
	
	self should: [browser browseContributions] raise: ProvideAnswerNotification.
	self assert: (browser selectedConversation contributions first versionInfo dateAndTime - browser selectedConversation initialMessage date) abs < 1 day