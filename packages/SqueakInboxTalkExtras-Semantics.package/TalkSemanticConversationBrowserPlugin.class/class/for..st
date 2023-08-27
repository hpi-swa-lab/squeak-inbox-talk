accessing
for: aConversationBrowser

	^ self plugins at: aConversationBrowser ifAbsentPut:
		[self newFor: aConversationBrowser]