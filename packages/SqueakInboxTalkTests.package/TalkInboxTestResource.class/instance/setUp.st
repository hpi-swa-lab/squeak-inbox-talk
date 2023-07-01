running
setUp

	| testCase |
	super setUp.
	
	testCase := TalkInboxBrowserTest new.
	testCase resetTalkCachesDuring: [
		testCase resetMailingCachesDuring: [
			inbox := TalkInbox squeakDev.
			self downloadEnoughFromInbox.
			cache := inbox class cache.
			squeakHistoryCaches := self readSqueakHistoryCaches]]