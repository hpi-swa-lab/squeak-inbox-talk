tests
testEscapeString

	| string |
	string := 'Hello world, how are you? (This is a test - special characters *very much* intended \-.-/ )'.
	self assert: (string matchesRegex: string escapeRegex).
	self assert: (string includesSubstring: 'Hello world, how are you?')
	"no all-out escaping"