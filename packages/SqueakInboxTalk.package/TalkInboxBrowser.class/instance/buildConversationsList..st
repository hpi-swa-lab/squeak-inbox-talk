toolbuilder
buildConversationsList: aBuilder

	^ aBuilder pluggableMultiColumnListSpec new
		model: self;
		list: #conversationColumns;
		getIndex: #selectedConversationIndex;
		setIndex: #selectedConversationIndex:;
		doubleClick: #openConversation;
		columnResizings: #(#shrinkWrap spaceFill);
		yourself