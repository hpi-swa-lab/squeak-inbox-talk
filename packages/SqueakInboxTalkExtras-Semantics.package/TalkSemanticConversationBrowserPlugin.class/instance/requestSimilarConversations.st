private
requestSimilarConversations

	similarConversations := #searching.
	
	self addBackgroundProcess:
		([[similarConversations := [self similarConversations]
			on: Error do: [:ex |
				similarConversations := TalkBackgroundException for: ex.
				Project current addDeferredUIMessage:
					[self changed: #similarConversations].
				[similarConversations waitForResolution] ensure:
					[similarConversations := #searching.
					Project current addDeferredUIMessage:
						[self changed: #similarConversations.
						self changed: #similarConversationsHeader "relevant if #semanticCorpus was initialized just now"]]]]
			ifCurtailed:
				[similarConversations := nil.
				Project current addDeferredUIMessage:
					[self changed: #similarConversations]].
	
		Project current addDeferredUIMessage:
			[self changed: #similarConversations]]
			
			forkAt: Processor userBackgroundPriority).