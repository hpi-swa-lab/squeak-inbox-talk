accessing
mostRecentConversations

	^ (self conversations sitSortedByHeavy: #latestDate) reversed
	"sorted: #latestDate descending
	optimized (~900% faster)"