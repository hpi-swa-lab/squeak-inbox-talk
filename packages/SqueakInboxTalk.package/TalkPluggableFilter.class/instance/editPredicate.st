*SqueakInboxTalk-UI-menus
editPredicate

	| newPredicateString |
	newPredicateString := Project uiManager
		request: ('Show {1} that <b>[:each | ...]</b>' asTextFromHtml format: {
			'conversations' asText addAllAttributes: {
				TextEmphasis underlined flag: #workaround.
				PluggableTextAttribute evalBlock: ["See Morphic-ct.1681"
				InspectorBrowser openOn: self inbox conversations anyOne]}})
		initialAnswer: (self predicateString ifNil: [self defaultPredicateString]).
	newPredicateString isEmptyOrNil ifTrue: [^ self].
	
	self compilePredicate: newPredicateString