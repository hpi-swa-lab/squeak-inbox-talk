tests
testBuild

	| browser |
	browser := self classUnderTest newDefault.
	self shouldnt: [ToolBuilder build: browser] raise: Error