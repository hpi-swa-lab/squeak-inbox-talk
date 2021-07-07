*SqueakInboxTalkTests-testing
talkBinaryState

	self updateContents.
	
	(self contentString beginsWithAnyOf: #('<on>' '<yes>')) ifTrue: [^ true].
	(self contentString beginsWithAnyOf: #('<off>' '<no>')) ifTrue: [^ false].
	^ nil