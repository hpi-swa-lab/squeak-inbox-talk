preferences - private
stringFromAge: age

	age isZero ifTrue: [^ '0']..
	^ age asString