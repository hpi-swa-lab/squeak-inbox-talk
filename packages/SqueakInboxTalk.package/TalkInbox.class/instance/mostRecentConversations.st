accessing
mostRecentConversations

	^ (self conversations talkSortedByHeavy: #latestDate) reversed
	"sorted: #latestDate descending
	optimized (~900% faster)"