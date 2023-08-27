running
setUp

	super setUp.
	
	self selector = #testBuildSqueakDev ifFalse: [self wrapTest: [:block | self resetTalkCachesDuring: block]].
	
	browser := self classUnderTest on: self mockConversation.
	self waitWhileBusy.
	
	self wrapTest: [:block | browser class defaultMessageFormat: #richText during: block].
	self wrapTest: [:block | browser inbox class disableSemanticSearchDuring: block].
	(Smalltalk classNamed: #TalkSemanticConversationBrowserPlugin) ifNotNil: [:plugin |
		plugin shouldIncludeSmartSummary ifTrue: [
			self wrapTest: [:block |
				plugin shouldIncludeSmartSummary: false.
				block ensure: [plugin shouldIncludeSmartSummary: true]]]].