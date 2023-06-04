running
setUp

	| testCase |
	super setUp.
	
	testCase := TalkInboxBrowserTest new.
	testCase resetTalkCachesDuring: [
		testCase resetMailingCachesDuring: [
			inbox := TalkInbox squeakDev.
			inbox downloadRange: 10 days.
				"(((TalkInbox squeakDev messages sorted: #date descending)
					select: [:ea | ea date year >= 2015])
						pairsCollect: [:a :b | a date - b date])
							max.
				-> 6:05:50:33"
			inbox refreshMessages.
			cache := inbox class cache.
			squeakHistoryCaches := self readSqueakHistoryCaches]]