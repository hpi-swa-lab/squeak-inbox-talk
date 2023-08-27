embeddings
updateFromInbox

	| newMessages |
	newMessages := self inbox messages asSet copyWithoutAll: self knownMessages asSet. "optimization (because data view hashes are so slow)"
	newMessages
		do: [:message | self addFragmentDocumentsFrom: message]
		semanticDisplayingRichProgress: 'Updating semantic corpus...'.
	
	self updateEmbeddings.