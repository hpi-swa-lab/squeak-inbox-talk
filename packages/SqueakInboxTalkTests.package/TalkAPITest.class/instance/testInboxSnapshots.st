tests
testInboxSnapshots

	self inboxSnapshots keysAndValuesDo: [:input :expected | | inbox |
		self resetTalkCachesDuring: [
			inbox := self inboxClass on: (input at: #mailingList).
			inbox mailingList now: (input at: #now).
			input at: #downloadRange ifPresent: [:duration |
				inbox downloadRange: duration.
				inbox updateMessages].
			
			self assertProperties: expected in: inbox]]