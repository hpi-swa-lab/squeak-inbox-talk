accessing
conversations

	self aggregatorClass hasCachedConversations ifFalse: [^ #()].
	^ (self aggregatorClass conversationsOn: {self name}) keys collect: [:wrapper | TalkMailConversation on: wrapper]