conversation gathering
startGatheringConversations

	| newConversations |
	conversations := newConversations := OrderedCollection with: #searching.
	self
		backgroundWorkerFor: #conversations
		do: [:updateBlock |
			[
				updateBlock value.
				(Generator on: [:generator | self gatherConversationsOn: generator]) do: [:conversation |
					newConversations add: conversation beforeIndex: newConversations size.
					updateBlock value].
				
				newConversations removeLast.
				updateBlock value] ifCurtailed: [
				conversations := #().
				self changed: #conversations]]
		updating: [
			conversations := newConversations copy.
			self changed: #conversations]
		thenDo: [self changed: #conversations]