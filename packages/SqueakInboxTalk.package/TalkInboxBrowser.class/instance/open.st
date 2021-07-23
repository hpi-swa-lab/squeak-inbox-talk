toolbuilder
open

	| result |
	result := super open.
	self selectConversation: nil.
	^ result