updating
dependentAspectsOn: aspect

	| dependentAspects |
	dependentAspects := super dependentAspectsOn: aspect.
	
	aspect = #selectedConversation ifTrue: [dependentAspects := #(#selectedConversationIndex #hasContributionsSelected #hasConversationSelected), dependentAspects].
	
	^ dependentAspects