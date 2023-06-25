*SqueakInboxTalk-UI-menus
editPredicate

	| newPredicateString |
	newPredicateString := Project uiManager
		multiLineRequest: ('Show {1} that <b>[:{2} | ...]</b>' asTextFromHtml format: {
			'conversations' asText addAllAttributes: {
				TextEmphasis underlined flag: #workaround.
				PluggableTextAttribute evalBlock: ["See Morphic-ct.1681"
				InspectorBrowser openOn: self inbox conversations anyOne]}.
			self argumentNameForConversation})
		initialAnswer: (self predicateString ifNil: [self defaultPredicateString]).
	newPredicateString isEmptyOrNil ifTrue: [^ self].
	
	self compilePredicate: newPredicateString