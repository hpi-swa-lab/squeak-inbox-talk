filtering
filter: conversations
	"Overridden for performance."

	| partSearchers |
	self isActive ifFalse: [^ conversations].
	
	partSearchers := self partSearchers.
	
	^ conversations select: [:conversation |
		partSearchers allSatisfy: [:searcher |
			(searcher matchesIn: conversation) talkIsEmpty not]]