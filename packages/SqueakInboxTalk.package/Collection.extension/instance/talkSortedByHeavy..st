*SqueakInboxTalk-Core-sorting
talkSortedByHeavy: propertyBlock

	self flag: #moveUpstream.
	
	^ ((self collect: [:ea | ea -> (propertyBlock value: ea)]) sorted: [:assoc | assoc value] asSortFunction) collect: [:assoc | assoc key]