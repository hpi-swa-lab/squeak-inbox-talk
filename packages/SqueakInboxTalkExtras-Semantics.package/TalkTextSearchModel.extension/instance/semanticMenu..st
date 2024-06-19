*SqueakInboxTalkExtras-Semantics-UImenu
semanticMenu: menu
	<specialMatchStrategyMenu>

	menu add: 'chat with agent' action:
		[self dependents
			detect: [:ea | ea isKindOf: TalkConversationBrowser]
			ifFound: [:browser | browser semanticPlugin chatWithConversation]
			ifNone:
				[TalkSemanticAgent openNewConversationForInbox:
					(self dependents
						detect: [:ea | ea isKindOf: TalkInboxBrowser]
						ifFound: [:browser | browser inbox]
						ifNone: [TalkInbox squeakDev])]].
	
	^ menu