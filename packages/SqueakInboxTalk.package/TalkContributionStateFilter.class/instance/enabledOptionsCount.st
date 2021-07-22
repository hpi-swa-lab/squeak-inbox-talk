accessing
enabledOptionsCount

	^ self allStates count: [:state | (self hasState: state) not]