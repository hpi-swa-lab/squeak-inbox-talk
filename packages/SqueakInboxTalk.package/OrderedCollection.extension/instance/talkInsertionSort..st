*SqueakInboxTalk-Core-sorting
talkInsertionSort: aSortBlock

	self size <= 1 ifTrue: [^ self].
	array talkInsertionSort: aSortBlock.