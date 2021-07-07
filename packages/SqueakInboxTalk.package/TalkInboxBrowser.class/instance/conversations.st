accessing
conversations

	^ conversations ifNil: [ | newConversations |
		[
			newConversations := [
				self gatherConversations
				"Avoid infinite loop"]
				on: Error, Warning, Halt
				ensure: [newConversations := #()]] ensure: [
			newConversations ifNotNil: [
				self terminateBackgroundWorkerFor: #conversations.
				conversations := newConversations]]]