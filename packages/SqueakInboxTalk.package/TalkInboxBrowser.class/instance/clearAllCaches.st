actions
clearAllCaches

	(self confirm: 'This will remove all cached messages, conversations, and contributions from your image. Downloading them again might take some time.\\Do you want to continue?' withCRs) ifFalse: [^ false].
	
	self terminateBackgroundWorkerFor: #conversations.
	
	allConversations := conversations := #().
	cachedConversationColumns := nil.
	"Invalidate lists in case clearing gets curtailed."
	self inbox class clearAllCaches.
	TalkProject clearAllCaches.
	
	allConversations := conversations := #().
	self changed: #allConversations.
	self inform: 'All caches were reset.'.
	
	^ true