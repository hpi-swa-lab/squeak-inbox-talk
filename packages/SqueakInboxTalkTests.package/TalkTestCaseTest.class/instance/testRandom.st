tests - accessing
testRandom

	self withNewCaseDo: [:case | self should: [case random next between: 0 and: 1]].
	
	self withNewCaseDo: [:firstCase | | firstRandom |
		self patch: firstCase at: #randomSeed withValue: 42.
		firstRandom := firstCase random next.
		self withNewCaseDo: [:secondCase | | secondRandom |
			self patch: secondCase at: #randomSeed withValue: 42.
			secondRandom := secondCase random next.
			self assert: firstRandom equals: secondRandom]]