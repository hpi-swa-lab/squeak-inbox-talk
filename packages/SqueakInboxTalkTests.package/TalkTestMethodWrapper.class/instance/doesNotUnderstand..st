system primitives
doesNotUnderstand: aMessage

	self isWrapperForExistingMethod ifFalse: [^ aMessage sendTo: self nullMethod].
	^ aMessage sendTo: method