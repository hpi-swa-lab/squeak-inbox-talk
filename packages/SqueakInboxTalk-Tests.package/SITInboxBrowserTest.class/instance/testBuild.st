tests
testBuild

	| browser |
	browser := SITInboxBrowser newDefault.
	self shouldnt: [ToolBuilder build: browser] raise: Error