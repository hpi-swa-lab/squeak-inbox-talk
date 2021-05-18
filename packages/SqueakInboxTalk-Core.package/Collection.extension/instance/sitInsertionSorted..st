*SqueakInboxTalk-Core-sorting
sitInsertionSorted: aSortBlockOrNil

	self flag: #moveUpstream.
	
	^ self asArray sitInsertionSort: aSortBlockOrNil