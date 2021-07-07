*SqueakInboxTalk-UI-ui requests
talkChooseMultipleFromLabeledValues: aDictionary title: aString

	self flag: #moveUpstream.
	
	^ self chooseMultipleFrom: aDictionary keys values: aDictionary values title: aString