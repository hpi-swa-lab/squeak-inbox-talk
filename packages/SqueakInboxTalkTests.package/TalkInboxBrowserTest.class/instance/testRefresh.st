tests
testRefresh
	"seconds"
	<timeout: 30>

	self wrapTest: [:block | self resetTalkCachesDuring: block].
	browser := self classUnderTest newDefault.
	self patch: browser inbox at: #downloadRange withValue: 14 days.
	
	self shouldntFail: [browser refreshMessages].
	self waitWhileBusy.
	
	self deny: browser conversations isEmpty.
	self assert: (browser refreshMessagesHelp asString includesSubstring: (String streamContents: [:stream | DateAndTime now printYMDOn: stream]))