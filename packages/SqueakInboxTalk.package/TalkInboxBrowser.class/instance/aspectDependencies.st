updating
aspectDependencies

	^ super aspectDependencies
		at: #allConversations put: #(#inbox #numberOfConversations);
		at: #conversations put: #(#allConversations #filters #search);
		at: #conversationColumns put: #(#conversations);
		at: #contents put: #(#hasSearchError #conversations #selectedConversation);
		at: #filterLabel put: #(#filters);
		at: #labelString put: #(#inbox);
		at: #revertChanges put: #(#contents);
		yourself