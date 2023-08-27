accessing - caches
messagesPerIds
	"Cached."

	^ messagesPerIds ifNil: [ 
		| dictionary |
		dictionary := Dictionary new.
		self messages do: [:message |
			dictionary at: message messageId put: message].
		messagesPerIds := dictionary]