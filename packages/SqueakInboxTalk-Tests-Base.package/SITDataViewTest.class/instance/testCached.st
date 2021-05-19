tests
testCached

	| cache defaultKey first second third |
	cache := Dictionary new.
	self patch: self classUnderTest at: #cache toValue: cache.
	defaultKey := self classUnderTest new dataKey.
	
	first := self classUnderTest new.
	self patch: first at: #dataKey toValue: defaultKey, {1}.
	second := self classUnderTest new.
	self patch: second at: #dataKey toValue: defaultKey, {2}.
	self assert: first identical: first cached.
	self assert: second identical: second cached.
	
	third := self classUnderTest new.
	self patch: third at: #dataKey toValue: defaultKey, {1}.
	self assert: first identical: third cached