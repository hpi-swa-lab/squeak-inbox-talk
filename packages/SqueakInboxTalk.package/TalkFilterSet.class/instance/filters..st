accessing
filters: aCollection

	filters ifNotNil: [filters do: [:filter | filter removeDependent: self]].
	filters := aCollection.
	filters do: [:filter | filter addDependent: self].
	
	self changed