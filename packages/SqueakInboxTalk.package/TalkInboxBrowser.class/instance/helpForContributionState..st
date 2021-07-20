accessing - toolbuilder
helpForContributionState: aConversation

	^ aConversation contributionState
		caseOf: {
			[#pending] -> ['This contribution is <b>pending review.</b>' asTextFromHtml].
			[#treated] -> ['This contribution was <b>reviewed and treated.</b>' asTextFromHtml format: {aConversation contributions anyOne}].
			[#merged] -> ['This contribution was <b>accepted and merged.</b>' asTextFromHtml].
			[#trunk] -> ['This contribution was added <b>directly to {1}.</b>' asTextFromHtml format: {aConversation contributions anyOne project name}]}
		otherwise: #yourself