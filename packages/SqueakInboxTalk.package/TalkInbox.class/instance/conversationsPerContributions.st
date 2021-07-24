accessing - caches
conversationsPerContributions
	"Cached."

	^ conversationsPerContributions ifNil: [ | dictionary |
		dictionary := Dictionary new.
		self conversations do: [:conversation | conversation contributions do: [:contribution | (dictionary at: contribution ifAbsentPut: [Set new]) add: conversation]].
		conversationsPerContributions := dictionary]