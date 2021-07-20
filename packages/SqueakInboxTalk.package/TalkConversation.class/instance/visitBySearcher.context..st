searching
visitBySearcher: aTextSearcher context: anObject

	| children visitedMessages |
	children := SortedCollection sortBlock: #date ascending.
	visitedMessages := OrderedCollection new.
	self contributions do: [:contribution |
		children add: contribution.
		visitedMessages addAll: contribution messages].
	(self messages copyWithoutAll: visitedMessages) do: [:message | children add: message].
	
	children do: [:ea | aTextSearcher visit: ea context: anObject]