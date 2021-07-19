running
setUp

	super setUp.
	
	browser := self classUnderTest on: TalkInboxResource current inbox.
	self patchClass: TalkDataView class at: #cache withValue: TalkInboxResource current cache.
	self waitWhileBusy