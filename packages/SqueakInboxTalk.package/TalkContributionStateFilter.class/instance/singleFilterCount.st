accessing
singleFilterCount

	^ self allStates count: [:state | (self hasState: state) not]