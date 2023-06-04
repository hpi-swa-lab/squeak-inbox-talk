toolbuilder
conversationMenu: menu

	self selectedConversation ifNotNil: [:conversation |
		menu defaultTarget: conversation.
		
		menu add: 'open (b)' help: 'browse the selected conversation' action: #open.
		conversation hasContributions ifTrue: [
			menu add: 'browse contribution (B)' action: #browseContributions].
		menu addLine.
		
		menu
			add: 'inspect (i)' action: #inspect;
			add: 'explore (I)' action: #explore;
			add: 'open in Nabble forum' action: #openInNabble;
			add: 'open in pipermail archive' action: #openInPipermail.
		menu addLine].
	
	self filterMenu: menu.
	
	^ menu