initialize-release
initializeForBrowser: aConversationBrowser

	browsers := WeakArray with: aConversationBrowser.
	self addDependent: self browser.