*SqueakInboxTalk-Core-sorting
talkInsertionSorted: aSortBlockOrNil

	self flag: #moveUpstream.
	
	^ self asArray talkInsertionSort: aSortBlockOrNil