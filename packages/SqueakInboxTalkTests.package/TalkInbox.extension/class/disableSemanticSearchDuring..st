*SqueakInboxTalkTests-preferences
disableSemanticSearchDuring: aBlock

	self enableSemanticSearch ifFalse: [^ aBlock value].
	
	self enableSemanticSearch: false.
	^ aBlock ensure: [
		self enableSemanticSearch: true]