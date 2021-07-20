accessing - toolbuilder
conversationIconFor: aConversation atColumnNamed: column

	| icon |
	icon := column
		caseOf: {
			[#contributionState] -> [self iconForContributionState: aConversation contributionState].
			[#involvementState] -> [TalkPerson hasCurrent ifTrue: [self iconForInvolvementState: aConversation involvementState]]}
		otherwise: [^ nil].
	
	^ ((icon ifNil: [^ nil]) scaledIntoFormOfSize: 12) scaleIconToDisplay