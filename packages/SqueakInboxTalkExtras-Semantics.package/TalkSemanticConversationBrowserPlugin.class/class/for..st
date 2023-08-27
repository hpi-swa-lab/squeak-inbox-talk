accessing
for: aConversationBrowser

	^ self instances at: aConversationBrowser ifAbsentPut:
		[self newFor: aConversationBrowser]