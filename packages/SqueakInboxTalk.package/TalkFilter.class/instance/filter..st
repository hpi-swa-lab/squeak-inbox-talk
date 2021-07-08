filtering
filter: conversations

	self isActive ifFalse: [^ conversations].
	^ conversations select: [:conversation | self accepts: conversation]