accessing - toolbuilder
conversationIconFor: aConversation atColumnNamed: column

	| icon |
	icon := column
		caseOf: {
			[#contributionState] -> [self iconForContributionState: aConversation contributionState].
			[#involvementState] -> [TalkPerson hasCurrent ifTrue: [self iconForInvolvementState: aConversation involvementState]]}
		otherwise: [^ nil].
	
	^ (icon scaledToHeight: 12) scaleIconToDisplay