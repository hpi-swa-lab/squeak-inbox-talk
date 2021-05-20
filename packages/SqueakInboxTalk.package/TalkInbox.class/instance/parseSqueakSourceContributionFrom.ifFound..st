contribution parsing
parseSqueakSourceContributionFrom: aMessage ifFound: contributionBlock

	| contribution |
	(self squeakSourceMailers includes: aMessage author) ifFalse: [^ nil].
	aMessage subject = 'Daily Commit Log' ifTrue: [^ nil].
	
	contribution :=  TalkRepositoryContribution parseFor: self fromSubject: aMessage subject.
	contribution ifNil: [
		"self notify: 'Unknown SqueakSource mail format!'."
		self flag: #todo. "Support old format where version name is in body"
		^ nil].
	^ contributionBlock value: contribution