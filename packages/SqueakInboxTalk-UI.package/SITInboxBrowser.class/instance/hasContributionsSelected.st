testing
hasContributionsSelected

	^ (self selectedConversation ifNil: [^ false]) hasContributions