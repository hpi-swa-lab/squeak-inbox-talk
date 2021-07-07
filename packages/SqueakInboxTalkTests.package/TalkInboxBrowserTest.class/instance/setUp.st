running
setUp

	super setUp.
	
	browser := self classUnderTest on: TalkInboxResource current inbox.
	self patchAll: TalkDataView withAllSubclasses at: #cache withValue: TalkInboxResource current cache.
	self waitWhileBusy