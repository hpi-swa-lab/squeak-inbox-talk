matching
matchesIn: talkObject
	"Yield a match instance for every occurence in the depths of talkObject. Answer a generator stream that can be iterated in a lazy fashion to retrieve just as match matches as needed."

	self hasComplexTerm ifTrue: [^ self partSearchers talkAsGenerator gather: [:searcher | searcher matchesIn: talkObject]].
	
	^ Generator on: [:gen | talkObject visitBySearcher: self context: gen]