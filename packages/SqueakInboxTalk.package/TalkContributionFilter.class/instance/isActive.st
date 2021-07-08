testing
isActive

	^ (self withContributions and: [self withoutContributions]) not