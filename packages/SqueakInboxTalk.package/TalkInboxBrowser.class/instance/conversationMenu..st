toolbuilder
conversationMenu: menu

	self selectedConversation ifNotNil: [:conversation |
		menu defaultTarget: conversation.
		
		menu
			add: 'open' help: 'browse the selected conversation' action: #open;
			add: 'browse contribution' action: #browseContributions.
		menu addLine.
		
		menu
			add: 'inspect' action: #inspect;
			add: 'open in nabble archive' action: #openInNabble;
			add: 'open in pipermail archive' action: #openInPipermail.
		menu addLine].
	
	self filterMenu: menu.
	
	^ menu