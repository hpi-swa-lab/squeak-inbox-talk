running
setUp

	| testCase |
	super setUp.
	
	testCase := TalkInboxBrowserTest new.
	testCase resetTalkCachesDuring: [
		testCase resetMailingCachesDuring: [
			inbox := TalkInbox squeakDev.
			inbox downloadRange: 10 days.
			inbox refreshMessages.
			cache := inbox class cache.
			squeakHistoryCaches := self readSqueakHistoryCaches]]