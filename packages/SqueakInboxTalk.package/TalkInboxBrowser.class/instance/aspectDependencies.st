updating
aspectDependencies

	^ super aspectDependencies
		at: #allConversations put: #(#inbox #numberOfConversations);
		at: #conversations put: #(#allConversations #filters #search);
		at: #conversationColumns put: #(#conversations);
		at: #contents put: #(#emptyContents #hasSearchError #selectedConversation);
		at: #emptyContents put: #(#allConversations);
		at: #filterLabel put: #(#filters);
		at: #labelString put: #(#inbox);
		at: #refreshMessagesColor put: #(#allConversations #step);
		at: #revertChanges put: #(#contents);
		yourself