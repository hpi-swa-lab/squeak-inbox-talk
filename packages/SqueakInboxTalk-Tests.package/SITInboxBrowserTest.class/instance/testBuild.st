tests
testBuild

	| browser |
	browser := SITInboxBrowser new.
	self shouldnt: [ToolBuilder build: browser] raise: Error.