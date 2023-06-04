toolbuilder
buildConversationsList: aBuilder

	^ aBuilder pluggableMultiColumnListSpec new
		model: self;
		list: #conversationColumns;
		icon: #conversationIconAtRow:atColumn:;
		getIndex: #selectedConversationIndex;
		setIndex: #selectedConversationIndex:;
		helpItem: #conversationHelpAtRow:atColumn:;
		menu: #conversationMenu:;
		doubleClick: #openConversation;
		keyPress: #conversationsListKey:;
		columnResizings: #(#shrinkWrap #shrinkWrap #spaceFill #shrinkWrap);
		itemAlignments: #(#left #left #left #right);
		itemPaddings: {3 @ 0 extent: 7 @ 0. 0 @ 0. 3 @ 0. 3 @ 0};
		yourself