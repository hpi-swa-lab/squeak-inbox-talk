system primitives
doesNotUnderstand: aMessage

	method = #new ifTrue: [^ aMessage sendTo: self nullMethod].
	^ aMessage sendTo: method