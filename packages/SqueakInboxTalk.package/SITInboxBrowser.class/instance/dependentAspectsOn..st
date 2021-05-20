updating
dependentAspectsOn: aspect

	^ aspect
		caseOf: {
			[#conversations] -> [
				(self conversations includes: self selectedConversation) ifFalse: [self selectConversation: nil].
				#(#conversationColumns)].
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