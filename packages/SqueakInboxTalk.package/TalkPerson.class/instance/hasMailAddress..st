testing
hasMailAddress: aString

	^ self mailAddresses anySatisfy: [:mailAddress | mailAddress asLowercase = aString asLowercase]