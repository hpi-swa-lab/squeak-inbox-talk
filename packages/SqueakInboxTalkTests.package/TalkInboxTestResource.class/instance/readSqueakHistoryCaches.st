private
readSqueakHistoryCaches

	| aggregatorClass |
	aggregatorClass := TalkMailingList aggregatorClass.
	^ #(#CachedConversations #CachedMessages #RulesForAuthorKeyNormalizationDerived)
		collect: [:key | key -> (aggregatorClass classPool at: key)]
		as: Dictionary