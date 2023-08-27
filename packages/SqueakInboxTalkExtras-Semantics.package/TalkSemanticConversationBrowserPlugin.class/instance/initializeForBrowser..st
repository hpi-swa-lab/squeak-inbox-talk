initialize-release
initializeForBrowser: aConversationBrowser

	browsers := WeakArray with: aConversationBrowser.
	self addDependent: self browser.
	self browser when: #windowIsClosing send: #windowIsClosing to: self.