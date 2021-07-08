testing
includesMentionOf: aPerson

	^ self messages anySatisfy: [:message | (self inbox squeakSourceMailers includes: message author) not and: [message includesMentionOf: aPerson]]