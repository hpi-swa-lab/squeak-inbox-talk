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
		columnResizings: #(#shrinkWrap #spaceFill #shrinkWrap);
		itemAlignments: #(#left #left #right);
		itemPaddings: {3 @ 0. 7 @ 0. 3 @ 0};
		yourself