conversation gathering
startGatheringConversations

	| newConversations |
	self containingWindow ifNil: [^ self].
	
	conversations := newConversations := OrderedCollection with: #searching.
	cachedConversationColumns := nil.
	self
		backgroundWorkerFor: #conversations
		do: [:updateBlock |
			[
				updateBlock value.
				(Generator on: [:generator | self gatherConversationsOn: generator]) do: [:conversation |
					newConversations add: conversation beforeIndex: newConversations size.
					updateBlock value].
				
				newConversations removeLast. "#searching"
				updateBlock value] ifCurtailed: [
				conversations := #().
				self changed: #conversations]]
		updating: [
			conversations := newConversations copy.
			self changed: #conversations]
		thenDo: [self changed: #conversations]