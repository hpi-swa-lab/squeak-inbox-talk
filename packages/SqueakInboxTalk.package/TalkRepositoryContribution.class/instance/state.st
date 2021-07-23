accessing
state

	self repositoryName = #inbox ifTrue: [^ #pending].
	self repositoryName = #treated ifTrue: [^ #treated].
	
	(self initialMessage subject beginsWithAnyOf: self project inboxRepositoryLabels)
		ifTrue: [
			self repositoryName = #trunk ifTrue: [^ #merged].
			self repositoryName ifNil: [^ #treated
			"The version was removed from the repository group."]]
		ifFalse: [self repositoryName = #trunk ifTrue: [^ #trunk]].
	
	^ nil