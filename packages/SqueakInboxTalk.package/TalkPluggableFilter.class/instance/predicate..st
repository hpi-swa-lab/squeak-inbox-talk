accessing
predicate: evaluable
	"evaluable can be a block, MessageSend, autc. - anything that responds to #value: to take a TalkConversation instance. It can even be a CompiledMethod that takes a Context as an argument - see #compilePredicate:."

	self predicateString ifNotNil: [:predicateString | latestPredicateString := predicateString].
	
	predicate := evaluable.
	
	self changed