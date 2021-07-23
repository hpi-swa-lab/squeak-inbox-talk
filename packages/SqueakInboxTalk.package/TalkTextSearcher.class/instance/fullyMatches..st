searching
fullyMatches: talkObject

	^ self partSearchers allSatisfy: [:searcher | (searcher matchesIn: talkObject) talkIsEmpty not]