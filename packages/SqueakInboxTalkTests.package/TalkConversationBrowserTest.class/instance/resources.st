accessing
resources

	self selector = #testBuildSqueakDev ifFalse: [^ super resources].
	
	^ super resources copyWith: TalkInboxTestResource