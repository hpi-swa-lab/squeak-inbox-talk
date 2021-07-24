matching
fullyMatches: talkObject
	"Answer a boolean indicating whether my complete search term matches any part of the passed talkObject."

	^ self partSearchers allSatisfy: [:searcher | (searcher matchesIn: talkObject) talkIsEmpty not]