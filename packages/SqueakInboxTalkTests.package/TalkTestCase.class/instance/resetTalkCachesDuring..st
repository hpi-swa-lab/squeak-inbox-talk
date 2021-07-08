running
resetTalkCachesDuring: aBlock

	^ self patchAll: TalkDataView withAllSubclasses at: #cache withValue: Dictionary new during: aBlock