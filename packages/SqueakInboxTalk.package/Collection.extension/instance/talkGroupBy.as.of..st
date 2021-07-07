*SqueakInboxTalk-Core-enumerating
talkGroupBy: keyBlock as: dictionaryClass of: collectionClass

	| result |
	result := dictionaryClass new.
	self do: [:each | | key |
		key := keyBlock value: each.
		(result at: key ifAbsentPut: [collectionClass new]) add: each].
	^ result