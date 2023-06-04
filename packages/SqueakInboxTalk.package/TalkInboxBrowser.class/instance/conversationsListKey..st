toolbuilder
conversationsListKey: aCharacter

	| conversation |
	aCharacter = $l ifTrue: [
		self resetAllFilters.
		^ true].
	
	conversation := self selectedConversation ifNil: [^ false].
	aCharacter
		caseOf:
			{[$b] -> [conversation open].
			[$B] -> [conversation browseContributions].
		
			[$i] -> [conversation inspect].
			[$I] -> [conversation explore]}
		otherwise: [^ false].
	^ true