accessing - contents
fullContents

	| conversation contributions contribution |
	self hasConversationSelected ifFalse: [^ self emptyContents].
	searchModel isActive ifTrue: [^ self searchResultsPreview].
	
	conversation := self selectedConversation ifNil: [^ ''].
	contributions := conversation contributions.
	
	contributions size = 1 ifFalse: [^ conversation text].
	
	contribution := contributions anyOne.
	^ contribution summaryWithState