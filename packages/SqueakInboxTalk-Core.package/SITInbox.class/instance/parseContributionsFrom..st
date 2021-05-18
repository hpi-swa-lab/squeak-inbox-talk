contribution parsing
parseContributionsFrom: aMessage

	^ Array streamContents: [:stream |
		self parseSqueakSourceContributionFrom: aMessage ifFound: [:contribution |
			stream nextPut: contribution]]