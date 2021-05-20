tests
testCached

	| first second third |
	self patch: self classUnderTest at: #cache withValue: Dictionary new.
	
	first := self classUnderTest new.
	self patch: first at: #dataKey withValue: {1}.
	second := self classUnderTest new.
	self patch: second at: #dataKey withValue: {2}.
	self assert: first identical: first cached.
	self assert: second identical: second cached.
	
	third := self classUnderTest new.
	self patch: third at: #dataKey withValue: {1}.
	self assert: first identical: third cached