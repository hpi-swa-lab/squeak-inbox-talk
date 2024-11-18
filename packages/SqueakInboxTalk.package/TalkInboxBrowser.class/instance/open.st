toolbuilder
open

	| result |
	conversations := #().
	result := super open.
	self startGatheringConversations. "run in the background for faster UI responsiveness"
	^ result