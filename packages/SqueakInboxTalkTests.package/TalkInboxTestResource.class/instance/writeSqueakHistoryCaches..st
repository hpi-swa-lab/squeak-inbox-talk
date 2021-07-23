private
writeSqueakHistoryCaches: caches

	| aggregatorClass |
	aggregatorClass := TalkMailingList aggregatorClass.
	caches keysAndValuesDo: [:key :cache | aggregatorClass classPool at: key put: cache]