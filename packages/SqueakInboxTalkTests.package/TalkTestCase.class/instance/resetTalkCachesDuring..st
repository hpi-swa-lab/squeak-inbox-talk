running
resetTalkCachesDuring: aBlock

	^ self patchClass: TalkDataView class at: #cache withValue: Dictionary new during: aBlock