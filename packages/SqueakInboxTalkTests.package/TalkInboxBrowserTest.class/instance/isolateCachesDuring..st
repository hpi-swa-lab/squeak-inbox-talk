running
isolateCachesDuring: aBlock

	| aggregatorClass |
	(self isClassPatched: browser inbox class theMetaClass at: #cache) ifFalse: [^ self fail: 'Cache is not patched, aborting test to protect image data'].
	
	aggregatorClass := TalkMailingList aggregatorClass.
	#(#CachedConversations #CachedMessages #RulesForAuthorKeyNormalizationDerived) do: [:key |
		thisContext home talkWrap: [:block | | previousValue |
			previousValue := aggregatorClass classPool at: key.
			aggregatorClass classPool at: key put: previousValue copy.
			block ensure: [aggregatorClass classPool at: key put: previousValue]]].
	
	^ self
		patchClass: TalkDataView class
		at: #clearAllCaches
		with: [self wrapTest: [:block | self resetTalkCachesDuring: block]]
		during: aBlock