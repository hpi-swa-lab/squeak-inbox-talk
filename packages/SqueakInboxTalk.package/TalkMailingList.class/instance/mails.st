accessing
mails

	self aggregatorClass hasCachedMessages ifFalse: [^ #()].
	^ self aggregatorClass
		messagesOn: {self name}
		collect: [:wrapper | TalkMailObject on: wrapper]