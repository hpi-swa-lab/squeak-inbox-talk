accessing
messagesPerContributions
	"Cached."

	^ messagesPerContributions ifNil: [ | dictionary |
		dictionary := Dictionary new.
		self conversations do: [:conversation |
			conversation messages do: [:message |
				message contributions do: [:contribution | (dictionary at: contribution ifAbsentPut: [Set new]) add: message]]].
		messagesPerContributions := dictionary]