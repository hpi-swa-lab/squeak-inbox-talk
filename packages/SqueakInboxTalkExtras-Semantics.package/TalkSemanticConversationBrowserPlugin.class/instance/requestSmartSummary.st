private
requestSmartSummary

	smartSummary := #generating.
	
	[[smartSummary := [self smartSummary]
		on: Error do: [:ex |
			smartSummary := TalkBackgroundException for: ex.
			Project current addDeferredUIMessage:
				[self changed: #smartSummary].
			[smartSummary waitForResolution] ensure:
				[smartSummary := #generating.
				Project current addDeferredUIMessage:
					[self changed: #smartSummary]]]]
		ifCurtailed:
			[smartSummary := nil.
			Project current addDeferredUIMessage:
				[self changed: #smartSummary]].
	
	Project current addDeferredUIMessage:
		[self changed: #smartSummary].
	smartSummary isStreaming ifTrue:
		[smartSummary sendUpdatesFromTextModel: self selector: #smartSummaryText.
		smartSummary when: #completed evaluate:
			[Project current addDeferredUIMessage:
				[self changed: #smartSummary]]]]
		
		forkAt: Processor userBackgroundPriority.
	
	self flag: #todo. "Terminate these processes when window is closed and #cancelSmartSummary. Should we do this using background workers?"