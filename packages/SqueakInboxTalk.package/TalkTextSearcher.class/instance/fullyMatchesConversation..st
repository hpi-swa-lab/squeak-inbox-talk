searching
fullyMatchesConversation: aConversation

	^ self partSearchers allSatisfy: [:searcher | (searcher basicMatchesInConversation: aConversation) talkIsEmpty not]