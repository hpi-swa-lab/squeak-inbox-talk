running
importCachesFor: aTalkTestCase

	aTalkTestCase patchClass: TalkDataView class at: #cache withValue: self cache.
	aTalkTestCase wrapTest: [:block |
		aTalkTestCase resetMailingCachesDuring: [
			self writeSqueakHistoryCaches: self squeakHistoryCaches.
			block value]]