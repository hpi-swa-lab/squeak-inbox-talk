*BaselineOfSqueakInboxTalk-preferences
talkDontAttachToMouseCursorDuring: aBlock

	self flag: #moveUpstream.
	
	self openToolsAttachedToMouseCursor ifFalse: [^ aBlock value].
	
	self openToolsAttachedToMouseCursor: false.
	^ aBlock ensure: [self openToolsAttachedToMouseCursor: true]