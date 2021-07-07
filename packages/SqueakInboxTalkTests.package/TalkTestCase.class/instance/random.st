accessing
random

	^ random ifNil: [random := self setUpRandom]