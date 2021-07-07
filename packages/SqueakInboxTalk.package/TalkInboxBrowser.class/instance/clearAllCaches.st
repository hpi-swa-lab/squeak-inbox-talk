actions
clearAllCaches

	(self confirm: 'This will remove all cached messages, conversations, and contributions from your image.\Downloading them again might take some time.\\Do you want to continue?' withCRs) ifFalse: [^ false].
	
	self inbox class clearAllCaches.
	allConversations := #().
	self changed: #allConversations.
	^ true