searching
matchesInConversation: aConversation
	"Yield a match instance for every occurence in the depths of aConversation."

	^ self partSearchers talkAsGenerator gather: [:searcher | searcher basicMatchesInConversation: aConversation]