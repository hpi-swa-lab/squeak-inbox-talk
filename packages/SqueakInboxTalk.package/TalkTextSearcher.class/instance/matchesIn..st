matching
matchesIn: talkObject
	"Yield a match instance for every occurence in the depths of talkObject."

	self hasComplexTerm ifTrue: [^ self partSearchers talkAsGenerator gather: [:searcher | searcher matchesIn: talkObject]].
	
	^ Generator on: [:gen | talkObject visitBySearcher: self context: gen]