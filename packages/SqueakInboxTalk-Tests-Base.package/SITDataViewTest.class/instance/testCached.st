tests
testCached

	| first second third |
	self patch: self classUnderTest at: #cache toValue: Dictionary new.
	
	first := self classUnderTest new.
	self patch: first at: #dataKey toValue: {1}.
	second := self classUnderTest new.
	self patch: second at: #dataKey toValue: {2}.
	self assert: first identical: first cached.
	self assert: second identical: second cached.
	
	third := self classUnderTest new.
	self patch: third at: #dataKey toValue: {1}.
	self assert: first identical: third cached