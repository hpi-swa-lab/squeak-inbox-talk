testing
isActive

	^ (self allStates allSatisfy: [:state | self states includes: state]) not