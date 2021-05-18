accessing
mostRecentConversations

	self flag: #moveUpstream.
	"Why is this not in #sorted:?"
	^ ((self conversations collect: [:x | "sorted: #latestDate descending
	optimized (~900% faster)"
	x -> x latestDate]) sorted: #value descending) collect: #key