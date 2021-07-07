filtering
filter: conversations

	^ conversations select: [:conversation | self accepts: conversation]