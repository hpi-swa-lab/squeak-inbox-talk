tests
testInboxSnapshots

	self inboxSnapshots keysAndValuesDo: [:input :expected | | inbox |
		self resetTalkCachesDuring: [
			inbox := self buildInbox: input.
			
			self assertProperties: expected in: inbox]]