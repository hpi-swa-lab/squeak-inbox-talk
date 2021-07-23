running
resetMailingCachesDuring: aBlock

	| aggregatorClass |
	(self isClassPatched: TalkDataView class at: #cache) ifFalse: [^ self fail: 'Cache is not patched, aborting test to protect image data'].
	
	aggregatorClass := TalkMailingList aggregatorClass.
	#(#CachedConversations #CachedMessages #RulesForAuthorKeyNormalizationDerived) do: [:key |
		thisContext home talkWrap: [:block | | previousValue |
			previousValue := aggregatorClass classPool at: key.
			aggregatorClass classPool at: key put: Dictionary new.
			block ensure: [aggregatorClass classPool at: key put: previousValue]]].
	
	^ self
		patchClass: TalkDataView class
		at: #clearAllCaches
		with: [self wrapTest: [:block | self resetTalkCachesDuring: block]]
		during: aBlock