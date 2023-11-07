embeddings
updateFromInbox

	| newMessages |
	SemanticText assureSearchAvailableOr: [:requirements |
		(Project uiManager
			chooseOptionFromLabeledValues:
				(OrderedDictionary new
					at: 'Show instructions' put:
						[| steps |
						steps := 'To update the corpus for semantic search, you need to {1}. After that, please refresh the inbox again.' asText format:
							{SemanticText
								formatRequirements: requirements
								retry: []}.
						steps editWithLabel: 'Squeak Inbox Talk'];
					at: 'Ignore once' put: nil;
					yourself)
			title: 'To update the corpus for semantic search, you need to configure SemanticText first.')
		value].
	
	newMessages := self inbox messages asSet copyWithoutAll: self knownMessages asSet. "optimization (because data view hashes are so slow)"
	newMessages
		do: [:message | self addFragmentDocumentsFrom: message]
		semanticDisplayingRichProgress: 'Updating semantic corpus...'.
	
	self updateEmbeddings.