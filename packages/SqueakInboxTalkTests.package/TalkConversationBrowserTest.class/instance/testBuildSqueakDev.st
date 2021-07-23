tests
testBuildSqueakDev
	"seconds"
	<timeout: 30>

	TalkInboxTestResource current importCachesFor: self.
	TalkInboxTestResource current inbox conversations do: [:conversation | self testBuildFor: conversation]