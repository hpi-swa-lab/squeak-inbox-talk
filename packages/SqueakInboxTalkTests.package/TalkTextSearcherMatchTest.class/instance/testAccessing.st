tests
testAccessing

	| match object string |
	match := self classUnderTest new.
	
	object := Object new.
	string := 'Lorem ipsum dolor'.
	match object: object.
	match contents: string.
	match key: #key.
	match label: 'label'.
	match interval: (7 to: 11).
	
	self assert: object equals: match object.
	self assert: string equals: match contents.
	self assert: #key equals: match key.
	self assert: 'label' equals: match label.
	self
		assert: 7 equals: match start;
		assert: 11 equals: match stop.
	
	self assert: 'ipsum' equals: match basicMatchText