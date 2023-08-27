self-updating
ensureSemanticsPackageOrCancel

	(Smalltalk classNamed: #TalkSemanticConversationBrowserPlugin) ifNotNil: [:class | ^ class].
	(self confirm: 'Install SemanticText?') ifFalse: [^ nil].
	
	self basicSelfUpdateMetacelloSpec: {self selfUpdateMetacelloSpec. 'SqueakInboxTalkExtras-Semantic'}.
	self selfUpdateFromMetacello.