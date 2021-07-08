updating
changed: aspect

	aspect = #conversations ifTrue: [
		conversations ifNil: [self startGatheringConversations].
		self hasConversationSelected
			ifTrue: [(self conversations includes: self selectedConversation) ifFalse: [self selectConversation: nil]]
			ifFalse: [(contents isNil or: [self totalFilter isActive]) ifTrue: [self changedDependent: #contents]]].
	
	^ super changed: aspect