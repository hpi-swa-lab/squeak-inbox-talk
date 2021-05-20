*SqueakInboxTalk-Core-sorting
sitSortedByHeavy: aPropertyBlock

	self flag: #moveUpstream.
	
	^ ((self collect: [:ea | ea -> (aPropertyBlock value: ea)]) sorted: [:assoc | assoc value] asSortFunction) collect: [:assoc | assoc key]