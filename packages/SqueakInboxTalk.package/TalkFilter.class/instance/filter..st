filtering
filter: conversations
	"Filter the passed conversations and answer all elements that are accepted by the receiver. The argument conversations can be a collection or a stream - such as a lazy generator - of TalkConversation instances."

	self isActive ifFalse: [^ conversations].
	^ conversations select: [:conversation | self accepts: conversation]