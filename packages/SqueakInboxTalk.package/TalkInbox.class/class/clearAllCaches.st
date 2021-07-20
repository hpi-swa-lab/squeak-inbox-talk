caching
clearAllCaches
	"Exclude subinstances from global cache reset as they contain configuration. Instead reset their instance-side caches manually."

	| inboxes |
	self flag: #discuss.
	"This is a bit hacky and probably overriding #cache would be more idiomatic, but this would be harder to mock during the tests (see TalkInboxResource). Maybe revise this decision later."
	inboxes := self cache select: [:object | object isKindOf: self].
	
	[
		TalkMailingList clearAllCaches.
		
		super clearAllCaches] ensure: [
		inboxes do: [:inbox |
			inbox
				resetCaches;
				cached]]