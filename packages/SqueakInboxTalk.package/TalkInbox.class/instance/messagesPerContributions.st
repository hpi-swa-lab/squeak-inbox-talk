accessing - caches
messagesPerContributions
	"Cached."

	^ messagesPerContributions ifNil: [ | dictionary |
		dictionary := Dictionary new.
		self messages do: [:message | message contributions do: [:contribution | (dictionary at: contribution ifAbsentPut: [Set new]) add: message]].
		messagesPerContributions := dictionary]