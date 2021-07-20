accessing - toolbuilder
conversationHelpFor: aConversation atColumnNamed: column

	column
		caseOf: {
			[#contributionState] -> [^ self helpForContributionState: aConversation].
			[#involvementState] -> [TalkPerson hasCurrent ifTrue: [^ self helpForInvolvementState: aConversation]]}
		otherwise: [].
	
	^ Preferences balloonHelpInMessageLists ifTrue: [aConversation messages first text truncateWithElipsisTo: 200]