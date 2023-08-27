self-updating
ensureSemanticsPackageOrCancel

	(Smalltalk classNamed: #TalkSemanticConversationBrowserPlugin) ifNotNil: [:class | ^ class].
	(self confirm: 'Install SemanticText?') ifFalse: [^ nil].
	
	self basicSelfUpdateMetacelloSpec: {self basicSelfUpdateMetacelloSpec. 'SqueakInboxTalkExtras-Semantics'}.
	self selfUpdateFromMetacello.