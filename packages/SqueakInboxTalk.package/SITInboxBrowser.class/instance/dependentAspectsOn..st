updating
dependentAspectsOn: aspect

	^ aspect
		caseOf: {
			[#conversations] -> [#(#conversationColumns)].
			[#inbox] -> [#(#conversations #labelString)].
			[#labelString] -> [#(#windowTitle)].
			[#numberOfConversations] -> [
				conversations := nil.
				#(#conversations)].
			[#selectedConversation] -> [#(#conversationPreview #selectedConversationIndex #hasContributionsSelected #hasConversationSelected)].
			[#showingNonContributions] -> [
				conversations := nil.
				#(#conversations)]}
		otherwise: [#()]